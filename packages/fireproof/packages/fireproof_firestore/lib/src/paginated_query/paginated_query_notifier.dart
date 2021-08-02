import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof_firestore/src/models/query_snap.dart';
import 'package:fireproof_firestore/src/paginated_query/base_paginated_query_notifier.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PaginatedQueryNotifier<T, R extends Query<T>>
    extends BasePaginatedQueryNotifier<T, R> {
  PaginatedQueryNotifier({
    required R query,
    required int maxSnapshots,
    required int limit,
    required TestDoc<T> testDoc,
  }) : super(
          query: query,
          maxSnapshots: maxSnapshots,
          limit: limit,
          testDoc: testDoc,
        );

  var _querySnapshotStreams = <Stream<QuerySnap<T>>>[];

  DocumentSnapshot<T>? _lastDocumentSnapshot;

  StreamSubscription<QuerySnapshot<T>>? _lastDocumentSubscription;

  StreamSubscription<Iterable<QuerySnap<T>>>? _subscription;

  Stream<Iterable<QuerySnap<T>>> get _querySnapshotsStream {
    return CombineLatestStream(
      _querySnapshotStreams,
      (List<QuerySnap<T>> streamList) {
        return streamList;
      },
    );
  }

  @override
  void dispose() {
    _lastDocumentSubscription?.cancel();
    _subscription?.cancel();
    super.dispose();
  }

  void _updateSubscription() {
    final subscription = _subscription;

    if (subscription == null) {
      // We only go into waiting state if we're actually subscribed.
      state = state.inState(ConnectionState.waiting);
    } else {
      subscription.cancel();
    }

    _subscription = _querySnapshotsStream.listen(
      _handleStateChanges,
      onError: (Object error, StackTrace stackTrace) {
        state = AsyncSnapshot.withError(
          ConnectionState.none,
          error,
          stackTrace,
        );
      },
    );
  }

  void _handleStateChanges(Iterable<QuerySnap<T>> snapshots) {
    state = AsyncSnapshot.withData(ConnectionState.done, snapshots);
  }

  @override
  Future<bool> nextPage() {
    final completer = Completer<bool>();
    if (state.connectionState == ConnectionState.waiting) {
      assert(false, 'We should not fetch more pages while loading.');
    }

    Query<T> _query = query.limit(limit);
    final lastDocumentSnapshot = _lastDocumentSnapshot;
    if (lastDocumentSnapshot != null) {
      _query = _query.startAfterDocument(lastDocumentSnapshot);
    }

    final stream = _query.snapshots();

    _lastDocumentSubscription?.cancel();
    _lastDocumentSubscription = stream.listen(
      (QuerySnapshot<T> snapshot) {
        final isNotEmpty = snapshot.docs.isNotEmpty;

        completer.complete(isNotEmpty);
        _lastDocumentSubscription?.cancel();

        if (isNotEmpty) {
          _lastDocumentSnapshot = snapshot.docs.last;
        }
      },
      onError: completer.completeError,
    );

    if (_querySnapshotStreams.length >= maxSnapshots) {
      _querySnapshotStreams = _querySnapshotStreams.sublist(1);
    }

    final snapStream = stream.map((snapshot) {
      return QuerySnap.fromQuerySnapshot(
        snapshot: snapshot,
        testDoc: testDoc,
      );
    });

    _querySnapshotStreams = [..._querySnapshotStreams, snapStream];
    _updateSubscription();

    return completer.future;
  }

  @override
  Future<bool> previousPage() {
    final completer = Completer<bool>();
    if (state.connectionState == ConnectionState.waiting) {
      assert(false, 'We should not fetch more pages while loading.');
    }

    Query<T> _query = query.limitToLast(limit);
    final lastDocumentSnapshot = _lastDocumentSnapshot;
    if (lastDocumentSnapshot != null) {
      _query = _query.endBeforeDocument(lastDocumentSnapshot);
    }

    final stream = _query.snapshots();

    _lastDocumentSubscription?.cancel();
    // TODO: Is this really .first
    _lastDocumentSubscription = stream.listen(
      (QuerySnapshot<T> snapshot) {
        final isNotEmpty = snapshot.docs.isNotEmpty;

        completer.complete(isNotEmpty);
        _lastDocumentSubscription?.cancel();

        if (isNotEmpty) {
          _lastDocumentSnapshot = snapshot.docs.first;
        }
      },
      onError: completer.completeError,
    );

    if (_querySnapshotStreams.length >= maxSnapshots) {
      _querySnapshotStreams = [..._querySnapshotStreams]..removeLast();
    }

    final snapStream = stream.map((snapshot) {
      return QuerySnap.fromQuerySnapshot(
        snapshot: snapshot,
        testDoc: testDoc,
      );
    });

    _querySnapshotStreams = [snapStream, ..._querySnapshotStreams];
    _updateSubscription();

    return completer.future;
  }
}

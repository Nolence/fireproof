import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/src/paginated_query/base_paginated_query_notifier.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PaginatedQueryNotifier<T, R extends Query<T>>
    extends BasePaginatedQueryNotifier<T, R> {
  PaginatedQueryNotifier({
    required R query,
    required int maxSnapshots,
    required int limit,
  }) : super(
          query: query,
          maxSnapshots: maxSnapshots,
          limit: limit,
        );

  var _querySnapshotStreams = <Stream<QuerySnapshot<T>>>[];

  DocumentSnapshot<T>? _lastDocumentSnapshot;

  StreamSubscription<QuerySnapshot<T>>? _lastDocumentSubscription;

  StreamSubscription<Iterable<QuerySnapshot<T>>>? _subscription;

  Stream<Iterable<QuerySnapshot<T>>> get _querySnapshotsStream {
    return CombineLatestStream(
      _querySnapshotStreams,
      (List<QuerySnapshot<T>> streamList) {
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
    _subscription?.cancel();
    state = state.inState(ConnectionState.waiting);
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

  void _handleStateChanges(Iterable<QuerySnapshot<T>> snapshots) {
    state = AsyncSnapshot.withData(ConnectionState.done, snapshots);
  }

  @override
  void nextPage() {
    if (state.connectionState == ConnectionState.waiting) {
      assert(false, 'We should not fetch more pages while loading.');
    }

    Query<T> _query = query.limit(limit);
    final lastDocumentSnapshot = _lastDocumentSnapshot;
    if (lastDocumentSnapshot != null) {
      _query = query.startAtDocument(lastDocumentSnapshot);
    }

    final stream = _query.snapshots();

    _lastDocumentSubscription?.cancel();
    _lastDocumentSubscription = stream.listen((QuerySnapshot<T> snapshot) {
      _lastDocumentSnapshot = snapshot.docs.last;
    });

    if (_querySnapshotStreams.length >= maxSnapshots) {
      _querySnapshotStreams = _querySnapshotStreams.sublist(1);
    }

    _querySnapshotStreams = [..._querySnapshotStreams, stream];
    _updateSubscription();
  }

  @override
  void previousPage() {
    if (state.connectionState == ConnectionState.waiting) {
      assert(false, 'We should not fetch more pages while loading.');
    }

    Query<T> _query = query.limitToLast(limit);
    final lastDocumentSnapshot = _lastDocumentSnapshot;
    if (lastDocumentSnapshot != null) {
      _query = query.startAtDocument(lastDocumentSnapshot);
    }

    final stream = _query.snapshots();

    _lastDocumentSubscription?.cancel();
    // TODO: Is this really .first
    _lastDocumentSubscription = stream.listen((QuerySnapshot<T> snapshot) {
      _lastDocumentSnapshot = snapshot.docs.first;
    });

    if (_querySnapshotStreams.length >= maxSnapshots) {
      _querySnapshotStreams = [..._querySnapshotStreams]..removeLast();
    }

    _querySnapshotStreams = [stream, ..._querySnapshotStreams];
    _updateSubscription();
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/src/paginated_query/base_paginated_query_notifier.dart';
import 'package:flutter/material.dart';

class PaginatedQueryOnceNotifier<T, R extends Query<T>>
    extends BasePaginatedQueryNotifier<T, R> {
  PaginatedQueryOnceNotifier({
    required R query,
    required int maxSnapshots,
    required int limit,
  }) : super(
          query: query,
          maxSnapshots: maxSnapshots,
          limit: limit,
        );

  DocumentSnapshot<T>? _lastDocumentSnapshot;

  @override
  Future<void> nextPage() async {
    if (state.connectionState == ConnectionState.waiting) {
      assert(false, 'We should not fetch more pages while loading.');
    }

    state = state.inState(ConnectionState.waiting);

    Query<T> _query = query.limit(limit);
    final lastDocumentSnapshot = _lastDocumentSnapshot;
    if (lastDocumentSnapshot != null) {
      _query = query.startAtDocument(lastDocumentSnapshot);
    }

    final querySnapshot = await _query.get();

    if (mounted) {
      final data = state.data;
      var querySnapshots = data == null ? <QuerySnapshot<T>>[] : [...data];

      querySnapshots.add(querySnapshot);

      if (data != null && querySnapshots.length >= maxSnapshots) {
        querySnapshots = [...querySnapshots].sublist(1);
      }

      _lastDocumentSnapshot = querySnapshot.docs.last;
      state = AsyncSnapshot.withData(
        ConnectionState.done,
        querySnapshots,
      );
    }
  }

  @override
  Future<void> previousPage() async {
    if (state.connectionState == ConnectionState.waiting) {
      assert(false, 'We should not fetch more pages while loading.');
    }

    state = state.inState(ConnectionState.waiting);

    Query<T> _query = query.limitToLast(limit);
    final lastDocumentSnapshot = _lastDocumentSnapshot;
    if (lastDocumentSnapshot != null) {
      _query = query.startAtDocument(lastDocumentSnapshot);
    }

    final querySnapshot = await _query.get();

    if (mounted) {
      final data = state.data;
      var querySnapshots = data == null ? <QuerySnapshot<T>>[] : [...data];

      querySnapshots.insert(0, querySnapshot);

      if (querySnapshots.length >= maxSnapshots) {
        querySnapshots = [...querySnapshots]..removeLast();
      }

      _lastDocumentSnapshot = querySnapshot.docs.last;
      state = AsyncSnapshot.withData(
        ConnectionState.done,
        querySnapshots,
      );
    }
  }
}

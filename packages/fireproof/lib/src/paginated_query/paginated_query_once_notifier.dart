import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof/src/paginated_query/base_paginated_query_notifier.dart';
import 'package:flutter/material.dart';

class PaginatedQueryOnceNotifier<T, R extends Query<T>>
    extends BasePaginatedQueryNotifier<T, R> {
  PaginatedQueryOnceNotifier({
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

  DocumentSnapshot<T>? _lastDocumentSnapshot;

  @override
  Future<bool> nextPage() async {
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
      var querySnapshots = data == null ? <QuerySnap<T>>[] : [...data];
      final querySnap = QuerySnap.fromSnapshot(
        snapshot: querySnapshot,
        testDoc: testDoc,
      );

      querySnapshots.add(querySnap);

      if (data != null && querySnapshots.length >= maxSnapshots) {
        querySnapshots = [...querySnapshots].sublist(1);
      }

      if (querySnapshot.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshot.docs.last;
      }

      state = AsyncSnapshot.withData(
        ConnectionState.done,
        querySnapshots,
      );
    }

    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<bool> previousPage() async {
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
      var querySnapshots = data == null ? <QuerySnap<T>>[] : [...data];
      final querySnap = QuerySnap.fromSnapshot(
        snapshot: querySnapshot,
        testDoc: testDoc,
      );

      querySnapshots.insert(0, querySnap);

      if (querySnapshots.length >= maxSnapshots) {
        querySnapshots = [...querySnapshots]..removeLast();
      }

      if (querySnapshot.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshot.docs.last;
      }

      state = AsyncSnapshot.withData(
        ConnectionState.done,
        querySnapshots,
      );
    }

    return querySnapshot.docs.isNotEmpty;
  }
}

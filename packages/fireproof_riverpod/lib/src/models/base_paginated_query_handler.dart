import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof_riverpod/src/models/base_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
abstract class BasePaginatedQueryHandler<T, R extends Query<T>>
    implements BaseHandler<T, R> {
  BasePaginatedQueryHandler({
    required this.query,
    required this.testDoc,
    required int limit,
    required int maxSnapshots,
  })  : _paginatedQueryNotifier = PaginatedQueryNotifier(
          limit: limit,
          maxSnapshots: maxSnapshots,
          query: query,
          testDoc: testDoc,
        ),
        _paginatedQueryOnceNotifier = PaginatedQueryOnceNotifier(
          limit: limit,
          maxSnapshots: maxSnapshots,
          query: query,
          testDoc: testDoc,
        );

  @override
  final R query;

  @override
  final TestDoc<T> testDoc;

  final PaginatedQueryNotifier<T, R> _paginatedQueryNotifier;

  final PaginatedQueryOnceNotifier<T, R> _paginatedQueryOnceNotifier;

  late final paginatedQuery = StateNotifierProvider<
      PaginatedQueryNotifier<T, Query<T>>,
      AsyncSnapshot<Iterable<QuerySnap<T>>>>(
    (ref) {
      return _paginatedQueryNotifier;
    },
  );

  late final paginatedQueryOnce = StateNotifierProvider<
      PaginatedQueryOnceNotifier<T, Query<T>>,
      AsyncSnapshot<Iterable<QuerySnap<T>>>>(
    (ref) {
      return _paginatedQueryOnceNotifier;
    },
  );
}

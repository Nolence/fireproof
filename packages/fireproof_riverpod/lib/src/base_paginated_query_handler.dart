import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
abstract class BasePaginatedQueryHandler<T, R extends Query<T>> {
  BasePaginatedQueryHandler({
    required this.query,
    required int limit,
    required int maxSnapshots,
  })  : _paginatedQueryNotifier = PaginatedQueryNotifier(
          limit: limit,
          maxSnapshots: maxSnapshots,
          query: query,
        ),
        _paginatedQueryOnceNotifier = PaginatedQueryOnceNotifier(
          limit: limit,
          maxSnapshots: maxSnapshots,
          query: query,
        );

  final R query;

  final PaginatedQueryNotifier<T, R> _paginatedQueryNotifier;

  final PaginatedQueryOnceNotifier<T, R> _paginatedQueryOnceNotifier;

  late final paginatedQuery = StateNotifierProvider<
      PaginatedQueryNotifier<T, Query<T>>,
      AsyncSnapshot<Iterable<QuerySnapshot<T>>>>(
    (ref) {
      return _paginatedQueryNotifier;
    },
  );

  late final paginatedQueryOnce = StateNotifierProvider<
      PaginatedQueryOnceNotifier<T, Query<T>>,
      AsyncSnapshot<Iterable<QuerySnapshot<T>>>>(
    (ref) {
      return _paginatedQueryOnceNotifier;
    },
  );

  AutoDisposeFutureProviderFamily<DocumentSnapshot<T>?, String> get docSnapshot;

  AutoDisposeStreamProviderFamily<DocumentSnapshot<T>?, String>
      get docSnapshots;
}

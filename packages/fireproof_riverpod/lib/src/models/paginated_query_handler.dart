import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof_riverpod/src/models/base_paginated_query_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_handler.dart';

class PaginatedQueryHandler<T> extends BasePaginatedQueryHandler<T, Query<T>> {
  PaginatedQueryHandler({
    required Query<T> query,
    TestDoc<T> testDoc = BaseHandler.defaultTest,
    int maxSnapshots = 10,
    int limit = 10,
  }) : super(
          query: query,
          maxSnapshots: maxSnapshots,
          limit: limit,
          testDoc: testDoc,
        );

  /// This checks the cache of [PaginatedQueryOnceNotifier] to see
  /// if there is a cached result. If there is, it returns that result.
  @override
  late final docSnapshot = FutureProvider.autoDispose.family<Doc<T>?, String>(
    (ref, id) async {
      final asyncSnapshot = ref.watch(paginatedQueryOnce);

      final previousDoc =
          asyncSnapshot.data?.docs.firstWhereOrNull((doc) => doc.id == id);

      return previousDoc;
    },
  );

  /// This checks the cache of [PaginatedQueryNotifier] to see
  /// if there is a cached result. If there is, it returns that result.
  @override
  late final docSnapshots = StreamProvider.autoDispose.family<Doc<T>?, String>(
    (ref, id) async* {
      final asyncSnapshot = ref.watch(paginatedQuery);

      final previousDoc =
          asyncSnapshot.data?.docs.firstWhereOrNull((doc) => doc.id == id);

      yield previousDoc;
    },
  );
}

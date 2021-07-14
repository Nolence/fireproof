import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof_riverpod/src/models/base_paginated_query_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_handler.dart';

class PaginatedCollectionHandler<T>
    extends BasePaginatedQueryHandler<T, CollectionReference<T>> {
  PaginatedCollectionHandler({
    required CollectionReference<T> query,
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
  /// if there is a cached result. If there is, it returns that result otherwise
  /// it returns the result of `get.doc(id)`
  @override
  late final AutoDisposeFutureProviderFamily<Doc<T?>, String> docSnapshot =
      FutureProvider.autoDispose.family<Doc<T?>, String>(
    (ref, id) async {
      final asyncSnapshot = ref.watch(paginatedQueryOnce);
      final previousDoc =
          asyncSnapshot.data?.docs.firstWhereOrNull((doc) => doc.id == id);

      if (previousDoc != null) {
        return previousDoc;
      }

      final documentSnapshot = await query.doc(id).get();

      return MaybeDoc.fromSnapshot(documentSnapshot);
    },
  );

  @override
  late final AutoDisposeStreamProviderFamily<Doc<T?>, String> docSnapshots =
      StreamProvider.autoDispose.family<Doc<T?>, String>(
    (ref, id) async* {
      final asyncSnapshot = ref.watch(paginatedQuery);
      final previousDoc =
          asyncSnapshot.data?.docs.firstWhereOrNull((doc) => doc.id == id);

      if (previousDoc != null) {
        yield previousDoc;
      }

      yield* query.doc(id).snapshots().map((documentSnapshot) {
        return MaybeDoc.fromSnapshot(documentSnapshot);
      });
    },
  );
}

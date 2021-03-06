import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof_firestore/fireproof_firestore.dart';
import 'package:fireproof_riverpod_firestore/src/models/base_handler.dart';
import 'package:fireproof_riverpod_firestore/src/models/base_query_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

class QueryHandler<T> extends BaseQueryHandler<T, Query<T>> {
  QueryHandler({
    required Query<T> query,
    TestDoc<T> testDoc = BaseHandler.defaultTest,
  }) : super(
          query: query,
          testDoc: testDoc,
        );

  /// Forces a fetch of all the documents and returns a corresponding snapshot
  /// with the id `id`.
  @override
  late final AutoDisposeFutureProviderFamily<Doc<T>, String> docSnapshot =
      FutureProvider.autoDispose.family<Doc<T>, String>(
    (ref, id) async {
      final querySnapshot = await ref.watch(snapshot.future);

      return querySnapshot.docs.singleWhere((doc) => doc.id == id);
    },
  );

  @override
  late final AutoDisposeStreamProviderFamily<Doc<T>, String> docSnapshots =
      StreamProvider.autoDispose.family<Doc<T>, String>(
    (ref, id) async* {
      final asyncValue = ref.watch(snapshots);
      final data = asyncValue.data;

      if (data != null) {
        yield data.value.docs.singleWhere((doc) => doc.id == id);
      }
    },
  );

  @override
  late final snapshotIn =
      FutureProvider.autoDispose.family<QuerySnap<T>, KtList<String>>(
    (ref, ids) async {
      final _snapshot = await ref.watch(snapshot.future);

      return QuerySnap.fromQuerySnap(
        snapshot: _snapshot,
        testDoc: (doc) {
          return ids.contains(doc.id);
        },
      );
    },
  );

  @override
  late final snapshotsIn =
      StreamProvider.autoDispose.family<QuerySnap<T>, KtList<String>>(
    (ref, ids) async* {
      final asyncValue = ref.watch(snapshots);
      final snapshot = asyncValue.data;

      if (snapshot != null) {
        yield QuerySnap.fromQuerySnap(
          snapshot: snapshot.value,
          testDoc: (doc) {
            return ids.contains(doc.id);
          },
        );
      }
    },
  );
}

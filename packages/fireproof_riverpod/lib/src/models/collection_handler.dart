import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof_riverpod/src/models/base_handler.dart';
import 'package:fireproof_riverpod/src/models/base_query_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

@immutable
class CollectionHandler<T> extends BaseQueryHandler<T, CollectionReference<T>> {
  CollectionHandler({
    required CollectionReference<T> query,
    TestDoc<T> testDoc = BaseHandler.defaultTest,
  }) : super(
          query: query,
          testDoc: testDoc,
        );

  @override
  late final AutoDisposeStreamProviderFamily<Doc<T?>, String> docSnapshots =
      StreamProvider.autoDispose.family<Doc<T?>, String>(
    (ref, id) async* {
      final _document = ref
          .watch(snapshots)
          .data
          ?.value
          .docs
          .singleWhereOrNull((doc) => doc.id == id);

      if (_document != null) {
        yield _document;
      }

      yield* query.doc(id).snapshots().map((documentSnapshot) {
        return MaybeDoc.fromSnapshot(documentSnapshot);
      });
    },
  );

  @override
  late final AutoDisposeFutureProviderFamily<Doc<T?>, String> docSnapshot =
      FutureProvider.autoDispose.family<Doc<T?>, String>(
    (ref, id) async {
      final _document = ref
          .watch(snapshot)
          .data
          ?.value
          .docs
          .singleWhereOrNull((doc) => doc.id == id);

      if (_document != null) {
        return _document;
      }

      final documentSnapshot = await query.doc(id).get();

      return MaybeDoc.fromSnapshot(documentSnapshot);
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

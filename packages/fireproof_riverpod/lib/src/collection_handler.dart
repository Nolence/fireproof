import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fireproof_riverpod/src/base_query_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

@immutable
class CollectionHandler<T> extends BaseQueryHandler<T, CollectionReference<T>> {
  CollectionHandler({required CollectionReference<T> query})
      : super(query: query);

  @override
  late final docSnapshots =
      StreamProvider.autoDispose.family<DocumentSnapshot<T>, String>(
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

      yield* query.doc(id).snapshots();
    },
  );

  @override
  late final docSnapshot =
      FutureProvider.autoDispose.family<DocumentSnapshot<T>, String>(
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

      return await query.doc(id).get();
    },
  );

  @override
  late final docsInSnapshot = FutureProvider.autoDispose
      .family<Iterable<QueryDocumentSnapshot<T>>, KtList<String>>(
    (ref, ids) async {
      throw UnimplementedError();
      // final querySnapshot = await ref.watch(snapshot.future);

      // querySnapshot.docs.singleWhere((doc) => doc.id == id);
    },
  );

  @override
  late final docsInSnapshots = StreamProvider.autoDispose
      .family<Iterable<QueryDocumentSnapshot<T>>, KtList<String>>(
    (ref, ids) async* {
      throw UnimplementedError();
      // await for (final querySnapshot in ref.watch(snapshots.stream)) {
      //   yield querySnapshot.docs.singleWhere((doc) => doc.id == id);
      // }
    },
  );
}

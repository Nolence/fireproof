import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof_riverpod/src/models/base_query_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

// TODO: testDoc should be optional
@immutable
class CollectionHandler<T> extends BaseQueryHandler<T, CollectionReference<T>> {
  CollectionHandler({
    required CollectionReference<T> query,
    required TestDoc<T> testDoc,
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
  late final docsInSnapshot =
      FutureProvider.autoDispose.family<Iterable<Doc<T>>, KtList<String>>(
    (ref, ids) async {
      throw UnimplementedError();
      // final querySnapshot = await ref.watch(snapshot.future);

      // querySnapshot.docs.singleWhere((doc) => doc.id == id);
    },
  );

  @override
  late final docsInSnapshots =
      StreamProvider.autoDispose.family<Iterable<Doc<T>>, KtList<String>>(
    (ref, ids) async* {
      throw UnimplementedError();
      // await for (final querySnapshot in ref.watch(snapshots.stream)) {
      //   yield querySnapshot.docs.singleWhere((doc) => doc.id == id);
      // }
    },
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof_riverpod/src/base_query_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

class QueryHandler<T> extends BaseQueryHandler<T, Query<T>> {
  QueryHandler(Query<T> query) : super(query: query);

  /// Forces a fetch of all the documents and returns a corresponding snapshot
  /// with the id `id`.
  @override
  late final docSnapshot =
      FutureProvider.autoDispose.family<DocumentSnapshot<T>, String>(
    (ref, id) async {
      final querySnapshot = await ref.watch(snapshot.future);

      return querySnapshot.docs.singleWhere((doc) => doc.id == id);
    },
  );

  @override
  late final docSnapshots =
      StreamProvider.autoDispose.family<DocumentSnapshot<T>, String>(
    (ref, id) async* {
      await for (final querySnapshot in ref.watch(snapshots.stream)) {
        yield querySnapshot.docs.singleWhere((doc) => doc.id == id);
      }
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

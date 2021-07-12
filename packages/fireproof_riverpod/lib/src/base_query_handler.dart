import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

@immutable
abstract class BaseQueryHandler<T, R extends Query<T>> {
  BaseQueryHandler({
    required this.query,
  });

  final R query;

  late final snapshot = FutureProvider.autoDispose<QuerySnapshot<T>>(
    (ref) async {
      return await query.get();
    },
  );

  late final snapshots = StreamProvider.autoDispose<QuerySnapshot<T>>((ref) {
    return query.snapshots();
  });

  AutoDisposeFutureProviderFamily<DocumentSnapshot<T>, String> get docSnapshot;

  AutoDisposeStreamProviderFamily<DocumentSnapshot<T>, String> get docSnapshots;

  AutoDisposeFutureProviderFamily<Iterable<QueryDocumentSnapshot<T>>,
      KtList<String>> get docsInSnapshot;

  AutoDisposeStreamProviderFamily<Iterable<QueryDocumentSnapshot<T>>,
      KtList<String>> get docsInSnapshots;
}

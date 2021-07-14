import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof_riverpod/src/models/base_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kt_dart/kt.dart';

@immutable
abstract class BaseQueryHandler<T, R extends Query<T>>
    implements BaseHandler<T, R> {
  BaseQueryHandler({
    required this.query,
    required this.testDoc,
  });

  @override
  final R query;

  @override
  final TestDoc<T> testDoc;

  late final snapshot = FutureProvider.autoDispose<QuerySnap<T>>(
    (ref) async {
      final _snapshot = await query.get();

      return QuerySnap.fromSnapshot(
        snapshot: _snapshot,
        testDoc: testDoc,
      );
    },
  );

  late final snapshots = StreamProvider.autoDispose<QuerySnap<T>>((ref) {
    return query.snapshots().map(
      (_snapshot) {
        return QuerySnap.fromSnapshot(snapshot: _snapshot, testDoc: testDoc);
      },
    );
  });

  AutoDisposeFutureProviderFamily<Iterable<Doc<T>>, KtList<String>>
      get docsInSnapshot;

  AutoDisposeStreamProviderFamily<Iterable<Doc<T>>, KtList<String>>
      get docsInSnapshots;
}

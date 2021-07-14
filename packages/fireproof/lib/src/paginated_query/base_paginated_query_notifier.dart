import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class BasePaginatedQueryNotifier<T, R extends Query<T>>
    extends StateNotifier<AsyncSnapshot<Iterable<QuerySnap<T>>>>
    with LocatorMixin {
  BasePaginatedQueryNotifier({
    required this.query,
    required this.testDoc,
    this.maxSnapshots = 10,
    this.limit = 10,
  }) : super(const AsyncSnapshot.nothing());

  final TestDoc<T> testDoc;

  final R query;

  final int maxSnapshots;

  final int limit;

  void nextPage();

  void previousPage();
}

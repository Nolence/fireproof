import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class BasePaginatedQueryNotifier<T, R extends Query<T>>
    extends StateNotifier<AsyncSnapshot<Iterable<QuerySnapshot<T>>>>
    with LocatorMixin {
  BasePaginatedQueryNotifier({
    required this.query,
    this.maxSnapshots = 10,
    this.limit = 10,
  }) : super(const AsyncSnapshot.nothing());

  final R query;

  final int maxSnapshots;

  final int limit;

  void nextPage();

  void previousPage();
}

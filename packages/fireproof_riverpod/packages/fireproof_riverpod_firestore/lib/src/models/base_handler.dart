import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof_firestore/fireproof_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
abstract class BaseHandler<T, R extends Query<T>> {
  /// A Firestore query responsible for fetching documents.
  R get query;

  /// The reason we need this is solely for the fact that complex queries in
  /// Firestore are not yet supported. For example, a logical OR query is not
  /// supported. Matching on more than one field is also difficult.
  ///
  /// For now, the way we'll use to filter out docs is to get ALL of them and
  /// filter them using a test function.
  // TODO: (Blocked) remove
  TestDoc<T> get testDoc;

  /// The default is to just pass through all docs.
  static bool defaultTest(Doc doc) {
    return true;
  }

  AutoDisposeFutureProviderFamily<Doc<T?>?, String> get docSnapshot;

  AutoDisposeStreamProviderFamily<Doc<T?>?, String> get docSnapshots;
}

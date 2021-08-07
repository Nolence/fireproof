import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncSnapshot<DocumentSnapshot<T>> useDocument<T>({
  required DocumentReference<T> document,
  required bool listen,
  bool preserveState = false,

  /// Only used if listen is true.
  bool includeMetadataChanges = false,

  /// Only used if listen is false.
  GetOptions? getOptions,
}) {
  if (listen) {
    final stream = useStream(
      useMemoized(
        () => document.snapshots(
          includeMetadataChanges: includeMetadataChanges,
        ),
        [document, includeMetadataChanges],
      ),
      preserveState: preserveState,
    );

    return stream;
  } else {
    final future = useFuture(
      useMemoized(() => document.get(getOptions), [document, getOptions]),
      preserveState: preserveState,
    );

    return future;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncSnapshot<QuerySnapshot<T>> useCollection<T>({
  required CollectionReference<T> collection,
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
        () => collection.snapshots(
          includeMetadataChanges: includeMetadataChanges,
        ),
        [includeMetadataChanges],
      ),
      preserveState: preserveState,
    );

    return stream;
  } else {
    final future = useFuture(
      useMemoized(
        () => collection.get(getOptions),
        [getOptions],
      ),
      preserveState: preserveState,
    );

    return future;
  }
}

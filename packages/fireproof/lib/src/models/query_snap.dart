import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof/src/utils/sort_array.dart';

typedef TestDoc<T> = bool Function(Doc<T> doc);

/// This is to meant ot mimic QuerySnapshot but it should not really depend on
/// cloud_firestore as this is 'supposed' to be a seperate layer.
class QuerySnap<T> {
  factory QuerySnap.fromQuerySnapshot({
    required QuerySnapshot<T> snapshot,
    required TestDoc<T> testDoc,
  }) {
    final docs = snapshot.docs.toDocs.where(testDoc);
    final ids = docs.map((doc) => doc.id);
    final _docs = sortArray<Doc<T>, String>(
      docs,
      ids,
      indexRetrieval: (doc) => doc.id,
    );
    final _docChanges = sortArray<DocumentChange<T>, String>(
      snapshot.docChanges,
      ids,
      indexRetrieval: (docChange) => docChange.doc.id,
      ignoreNotFound: true,
    );

    return QuerySnap._(
      docChanges: _docChanges.toList(),
      docs: _docs.toList(),
      metadata: snapshot.metadata,
      size: _docs.length,
    );
  }

  factory QuerySnap.fromQuerySnap({
    required QuerySnap<T> snapshot,
    required TestDoc<T> testDoc,
  }) {
    final docs = snapshot.docs.where(testDoc);
    final ids = docs.map((doc) => doc.id);
    final _docs = sortArray<Doc<T>, String>(
      docs,
      ids,
      indexRetrieval: (doc) => doc.id,
    );
    final _docChanges = sortArray<DocumentChange<T>, String>(
      snapshot.docChanges,
      ids,
      indexRetrieval: (docChange) => docChange.doc.id,
      ignoreNotFound: true,
    );

    return QuerySnap._(
      docChanges: _docChanges.toList(),
      docs: _docs.toList(),
      metadata: snapshot.metadata,
      size: _docs.length,
    );
  }

  QuerySnap._({
    required this.docChanges,
    required this.docs,
    required this.metadata,
    required this.size,
  });

  // TODO: Remove DocumentChange and instead create own replica class
  final List<DocumentChange<T>> docChanges;

  final List<Doc<T>> docs;

  // TODO: Remove SnapshotMetadata and instead create own replica class
  final SnapshotMetadata metadata;

  final int size;
}

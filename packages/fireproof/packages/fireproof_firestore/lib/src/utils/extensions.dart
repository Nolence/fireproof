import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof_firestore/src/models/doc/doc.dart';
import 'package:fireproof_firestore/src/models/query_snap.dart';

extension QuerySnaps<T> on Iterable<QuerySnap<T>> {
  Iterable<Doc<T>> get docs {
    return expand((snapshot) => snapshot.docs).toList();
  }
}

extension ToDocsExtension<T> on Iterable<DocumentSnapshot<T>> {
  Iterable<Doc<T?>> get toDocs {
    return map(MaybeDoc.fromSnapshot);
  }

  Iterable<Doc<T>> get toDocsForce {
    return map(MaybeDoc.fromSnapshotForce);
  }
}

extension ToQueryDocsExtension<T> on Iterable<QueryDocumentSnapshot<T>> {
  Iterable<Doc<T>> get toDocs {
    return map(MaybeDoc.fromQuerySnapshot);
  }
}

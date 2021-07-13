import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/src/models/doc/doc.dart';

extension QuerySnapshots<T> on Iterable<QuerySnapshot<T>> {
  Iterable<QueryDocumentSnapshot<T>> get docs {
    return expand((snapshot) => snapshot.docs).toList();
  }
}

extension ToDocsExtension<T> on Iterable<DocumentSnapshot<T>> {
  Iterable<Doc<T?>> get toDocs {
    return map((doc) => MaybeDoc.fromSnapshot(doc));
  }

  Iterable<Doc<T>> get toDocsForce {
    return map((doc) => MaybeDoc.fromSnapshotForce(doc));
  }
}

extension ToQueryDocsExtension<T> on Iterable<QueryDocumentSnapshot<T>> {
  Iterable<Doc<T>> get toDocs {
    return map((doc) => MaybeDoc.fromQuerySnapshot(doc));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/src/models/doc/doc.dart';
import 'package:fireproof/src/utils/sort_array.dart';

typedef FilterDocs<T> = bool Function(Doc<T> docs);

class QuerySnap<T> extends QuerySnapshot<T> {
  factory QuerySnap({
    required Iterable<String> ids,
    required List<DocumentChange<T>> docChanges,
    required List<QueryDocumentSnapshot<T>> docs,
    required SnapshotMetadata metadata,
    required int size,
  }) {
    final _docs = sortArray<QueryDocumentSnapshot<T>, String>(
      docs,
      ids,
      indexRetrieval: (doc) => doc.id,
    );
    final _docChanges = sortArray<DocumentChange<T>, String>(
      docChanges,
      ids,
      indexRetrieval: (docChange) => docChange.doc.id,
      ignoreNotFound: true,
    );

    return QuerySnap._(
      docChanges: _docChanges.toList(),
      docs: _docs.toList(),
      metadata: metadata,
      size: _docs.length,
    );
  }

  QuerySnap._({
    required this.docChanges,
    required this.docs,
    required this.metadata,
    required this.size,
  });

  @override
  final List<DocumentChange<T>> docChanges;

  @override
  final List<QueryDocumentSnapshot<T>> docs;

  @override
  final SnapshotMetadata metadata;

  @override
  final int size;
}


// All of this should go on QuerySnap

// extension ToDocExtensionQuery<T> on Iterable<QueryDocumentSnapshot<T>> {
//   Iterable<Doc<T>> get toDocType {
//     return map(MaybeDoc.fromQuerySnapshot);
//   }
// }

// extension ToDocExtension<T> on Iterable<DocumentSnapshot<T>> {
//   Iterable<Doc<T?>> get toDocType {
//     return map(MaybeDoc.fromSnapshot);
//   }

//   Iterable<Doc<T?>> get toDocTypeForce {
//     return map(MaybeDoc.fromSnapshot);
//   }
// }

// // TODO: Move everything below here to Fireproof package.
// extension QuerySnapshotsExtension<T> on Iterable<QuerySnapshot<T>> {
//   Iterable<QueryDocumentSnapshot<T>> get docs {
//     return expand((querySnapshot) {
//       return querySnapshot.docs;
//     });
//   }

//   Iterable<QueryDocumentSnapshot<T>> docsWithIds(List<String> ids) {
//     return sortArray<QueryDocumentSnapshot<T>, String>(
//       docs,
//       ids,
//       indexRetrieval: (snapshot) => snapshot.id,
//     );
//   }

//   QueryDocumentSnapshot<T>? maybeQueryDoc(String id) {
//     return docs.firstWhereOrNull((doc) => doc.id == id);
//   }

//   QueryDocumentSnapshot<T> queryDoc(String id) {
//     return docs.singleWhere((doc) => doc.id == id);
//   }

//   Iterable<DocumentChange> get docChanges {
//     return expand((querySnapshot) {
//       return querySnapshot.docChanges;
//     });
//   }

//   Iterable<SnapshotMetadata> get metaData {
//     return map((querySnapshot) {
//       return querySnapshot.metadata;
//     });
//   }
// }
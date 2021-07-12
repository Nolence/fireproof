import 'package:cloud_firestore/cloud_firestore.dart';

extension QuerySnapshots<T> on Iterable<QuerySnapshot<T>> {
  List<DocumentSnapshot<T>> get docs {
    return expand((snapshot) => snapshot.docs).toList();
  }
}

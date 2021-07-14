import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof/src/paginated_query/paginated_query_once_notifier.dart';

class PaginatedCollectionOnceNotifier<T>
    extends PaginatedQueryOnceNotifier<T, CollectionReference<T>> {
  PaginatedCollectionOnceNotifier({
    required CollectionReference<T> query,
    required int maxSnapshots,
    required int limit,
    required TestDoc<T> testDoc,
  }) : super(
          query: query,
          maxSnapshots: maxSnapshots,
          limit: limit,
          testDoc: testDoc,
        );
}

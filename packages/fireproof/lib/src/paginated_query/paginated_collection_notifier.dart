import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproof/fireproof.dart';
import 'package:fireproof/src/paginated_query/paginated_query_notifier.dart';

class PaginatedCollectionNotifier<T>
    extends PaginatedQueryNotifier<T, CollectionReference<T>> {
  PaginatedCollectionNotifier({
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

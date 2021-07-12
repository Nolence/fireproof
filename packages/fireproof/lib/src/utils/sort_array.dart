import 'package:collection/collection.dart';

Iterable<T> sortArray<T extends Object, R extends Object>(
  Iterable<T> arrayToSort,
  Iterable<R> indexArray, {
  R Function(T item)? indexRetrieval,
  bool ignoreMismatch = true,
  bool ignoreNotFound = false,
}) {
  if (!ignoreMismatch) {
    if (arrayToSort.length != indexArray.length) {
      final isLarger = arrayToSort.length > indexArray.length;
      throw StateError(
        'Array to sort (${arrayToSort.length}) is ${isLarger ? 'larger' : 'smaller'}  than array index '
        '(${indexArray.length})',
      );
    }
  }

  if (ignoreNotFound) {
    final arrayToReturn = <T>[];

    for (var i = 0; i < indexArray.length; i++) {
      final index = indexArray.elementAt(i);
      final item = arrayToSort.singleWhereOrNull((item) {
        if (indexRetrieval == null) {
          return index == item;
        } else {
          return index == indexRetrieval(item);
        }
      });

      if (item != null) {
        arrayToReturn.add(item);
      }
    }

    return arrayToReturn;
  } else {
    return [
      ...indexArray.map(
        (index) {
          return arrayToSort.singleWhere(
            (item) {
              if (indexRetrieval == null) {
                return index == item;
              } else {
                return index == indexRetrieval(item);
              }
            },
          );
        },
      )
    ];
  }
}

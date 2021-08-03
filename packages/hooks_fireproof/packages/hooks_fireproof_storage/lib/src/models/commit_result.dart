import 'package:flutter/foundation.dart';

class CommitResult<T> {
  CommitResult(this.value, this.revert);

  /// This function will undo the commit operation so long as it maintains
  /// its lifetime.
  final AsyncCallback revert;

  final T value;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_result.freezed.dart';

@freezed
class ProgressResult<T> with _$ProgressResult<T> {
  const ProgressResult._();
  const factory ProgressResult(T value) = ProgressData<T>;
  const factory ProgressResult.none() = ProgressNone;

  /// Provides a value between 0 and 1 for the progress of the operation.
  const factory ProgressResult.loading(double progress) = ProgressLoading;
  const factory ProgressResult.error(Object error, StackTrace stackTrace) =
      ProgressErrorDetails;

  T? get data {
    return maybeWhen(
      (value) => value,
      orElse: () => null,
    );
  }
}

@freezed
class ProgressesResult<T> with _$ProgressesResult<T> {
  const ProgressesResult._();
  const factory ProgressesResult(List<T> value) = ProgressesData<T>;
  const factory ProgressesResult.none() = ProgressesNone;

  /// Provides a value between 0 and 1 for the progress of the operation.
  const factory ProgressesResult.loading(List<double> progress) =
      ProgressesLoading;
  const factory ProgressesResult.error(Object error, StackTrace stackTrace) =
      ProgressesErrorDetails;

  List<T>? get data {
    return maybeWhen(
      (value) => value,
      orElse: () => null,
    );
  }
}

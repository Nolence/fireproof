import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

// TODO: I need one of each kind:
// result: data, error
// asyncResult: data, error, loading
// asyncStreamResult: data, error, loading(progress)
@freezed
class Result<T> with _$Result<T> {
  const Result._();
  const factory Result(T value) = Data<T>;
  const factory Result.none() = None;
  const factory Result.loading() = Loading;
  const factory Result.error(Object error, StackTrace stackTrace) =
      ErrorDetails;

  T? get data {
    return maybeWhen(
      (value) => value,
      orElse: () => null,
    );
  }
}

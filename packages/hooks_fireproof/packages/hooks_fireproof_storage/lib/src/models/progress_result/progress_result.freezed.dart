// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'progress_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProgressResultTearOff {
  const _$ProgressResultTearOff();

  ProgressData<T> call<T>(T value) {
    return ProgressData<T>(
      value,
    );
  }

  ProgressNone<T> none<T>() {
    return ProgressNone<T>();
  }

  ProgressLoading<T> loading<T>(double progress) {
    return ProgressLoading<T>(
      progress,
    );
  }

  ProgressErrorDetails<T> error<T>(Object error, StackTrace stackTrace) {
    return ProgressErrorDetails<T>(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $ProgressResult = _$ProgressResultTearOff();

/// @nodoc
mixin _$ProgressResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(T value) $default, {
    required TResult Function() none,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(T value)? $default, {
    TResult Function()? none,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressData<T> value) $default, {
    required TResult Function(ProgressNone<T> value) none,
    required TResult Function(ProgressLoading<T> value) loading,
    required TResult Function(ProgressErrorDetails<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressData<T> value)? $default, {
    TResult Function(ProgressNone<T> value)? none,
    TResult Function(ProgressLoading<T> value)? loading,
    TResult Function(ProgressErrorDetails<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressResultCopyWith<T, $Res> {
  factory $ProgressResultCopyWith(
          ProgressResult<T> value, $Res Function(ProgressResult<T>) then) =
      _$ProgressResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ProgressResultCopyWithImpl<T, $Res>
    implements $ProgressResultCopyWith<T, $Res> {
  _$ProgressResultCopyWithImpl(this._value, this._then);

  final ProgressResult<T> _value;
  // ignore: unused_field
  final $Res Function(ProgressResult<T>) _then;
}

/// @nodoc
abstract class $ProgressDataCopyWith<T, $Res> {
  factory $ProgressDataCopyWith(
          ProgressData<T> value, $Res Function(ProgressData<T>) then) =
      _$ProgressDataCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$ProgressDataCopyWithImpl<T, $Res>
    extends _$ProgressResultCopyWithImpl<T, $Res>
    implements $ProgressDataCopyWith<T, $Res> {
  _$ProgressDataCopyWithImpl(
      ProgressData<T> _value, $Res Function(ProgressData<T>) _then)
      : super(_value, (v) => _then(v as ProgressData<T>));

  @override
  ProgressData<T> get _value => super._value as ProgressData<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(ProgressData<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ProgressData<T> extends ProgressData<T> {
  const _$ProgressData(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'ProgressResult<$T>(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressData<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $ProgressDataCopyWith<T, ProgressData<T>> get copyWith =>
      _$ProgressDataCopyWithImpl<T, ProgressData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(T value) $default, {
    required TResult Function() none,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(T value)? $default, {
    TResult Function()? none,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressData<T> value) $default, {
    required TResult Function(ProgressNone<T> value) none,
    required TResult Function(ProgressLoading<T> value) loading,
    required TResult Function(ProgressErrorDetails<T> value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressData<T> value)? $default, {
    TResult Function(ProgressNone<T> value)? none,
    TResult Function(ProgressLoading<T> value)? loading,
    TResult Function(ProgressErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ProgressData<T> extends ProgressResult<T> {
  const factory ProgressData(T value) = _$ProgressData<T>;
  const ProgressData._() : super._();

  T get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressDataCopyWith<T, ProgressData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressNoneCopyWith<T, $Res> {
  factory $ProgressNoneCopyWith(
          ProgressNone<T> value, $Res Function(ProgressNone<T>) then) =
      _$ProgressNoneCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ProgressNoneCopyWithImpl<T, $Res>
    extends _$ProgressResultCopyWithImpl<T, $Res>
    implements $ProgressNoneCopyWith<T, $Res> {
  _$ProgressNoneCopyWithImpl(
      ProgressNone<T> _value, $Res Function(ProgressNone<T>) _then)
      : super(_value, (v) => _then(v as ProgressNone<T>));

  @override
  ProgressNone<T> get _value => super._value as ProgressNone<T>;
}

/// @nodoc

class _$ProgressNone<T> extends ProgressNone<T> {
  const _$ProgressNone() : super._();

  @override
  String toString() {
    return 'ProgressResult<$T>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProgressNone<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(T value) $default, {
    required TResult Function() none,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(T value)? $default, {
    TResult Function()? none,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressData<T> value) $default, {
    required TResult Function(ProgressNone<T> value) none,
    required TResult Function(ProgressLoading<T> value) loading,
    required TResult Function(ProgressErrorDetails<T> value) error,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressData<T> value)? $default, {
    TResult Function(ProgressNone<T> value)? none,
    TResult Function(ProgressLoading<T> value)? loading,
    TResult Function(ProgressErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ProgressNone<T> extends ProgressResult<T> {
  const factory ProgressNone() = _$ProgressNone<T>;
  const ProgressNone._() : super._();
}

/// @nodoc
abstract class $ProgressLoadingCopyWith<T, $Res> {
  factory $ProgressLoadingCopyWith(
          ProgressLoading<T> value, $Res Function(ProgressLoading<T>) then) =
      _$ProgressLoadingCopyWithImpl<T, $Res>;
  $Res call({double progress});
}

/// @nodoc
class _$ProgressLoadingCopyWithImpl<T, $Res>
    extends _$ProgressResultCopyWithImpl<T, $Res>
    implements $ProgressLoadingCopyWith<T, $Res> {
  _$ProgressLoadingCopyWithImpl(
      ProgressLoading<T> _value, $Res Function(ProgressLoading<T>) _then)
      : super(_value, (v) => _then(v as ProgressLoading<T>));

  @override
  ProgressLoading<T> get _value => super._value as ProgressLoading<T>;

  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(ProgressLoading<T>(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ProgressLoading<T> extends ProgressLoading<T> {
  const _$ProgressLoading(this.progress) : super._();

  @override
  final double progress;

  @override
  String toString() {
    return 'ProgressResult<$T>.loading(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressLoading<T> &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  $ProgressLoadingCopyWith<T, ProgressLoading<T>> get copyWith =>
      _$ProgressLoadingCopyWithImpl<T, ProgressLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(T value) $default, {
    required TResult Function() none,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(T value)? $default, {
    TResult Function()? none,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressData<T> value) $default, {
    required TResult Function(ProgressNone<T> value) none,
    required TResult Function(ProgressLoading<T> value) loading,
    required TResult Function(ProgressErrorDetails<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressData<T> value)? $default, {
    TResult Function(ProgressNone<T> value)? none,
    TResult Function(ProgressLoading<T> value)? loading,
    TResult Function(ProgressErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProgressLoading<T> extends ProgressResult<T> {
  const factory ProgressLoading(double progress) = _$ProgressLoading<T>;
  const ProgressLoading._() : super._();

  double get progress => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressLoadingCopyWith<T, ProgressLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressErrorDetailsCopyWith<T, $Res> {
  factory $ProgressErrorDetailsCopyWith(ProgressErrorDetails<T> value,
          $Res Function(ProgressErrorDetails<T>) then) =
      _$ProgressErrorDetailsCopyWithImpl<T, $Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$ProgressErrorDetailsCopyWithImpl<T, $Res>
    extends _$ProgressResultCopyWithImpl<T, $Res>
    implements $ProgressErrorDetailsCopyWith<T, $Res> {
  _$ProgressErrorDetailsCopyWithImpl(ProgressErrorDetails<T> _value,
      $Res Function(ProgressErrorDetails<T>) _then)
      : super(_value, (v) => _then(v as ProgressErrorDetails<T>));

  @override
  ProgressErrorDetails<T> get _value => super._value as ProgressErrorDetails<T>;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ProgressErrorDetails<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ProgressErrorDetails<T> extends ProgressErrorDetails<T> {
  const _$ProgressErrorDetails(this.error, this.stackTrace) : super._();

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ProgressResult<$T>.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressErrorDetails<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stackTrace, stackTrace) ||
                const DeepCollectionEquality()
                    .equals(other.stackTrace, stackTrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stackTrace);

  @JsonKey(ignore: true)
  @override
  $ProgressErrorDetailsCopyWith<T, ProgressErrorDetails<T>> get copyWith =>
      _$ProgressErrorDetailsCopyWithImpl<T, ProgressErrorDetails<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(T value) $default, {
    required TResult Function() none,
    required TResult Function(double progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(T value)? $default, {
    TResult Function()? none,
    TResult Function(double progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressData<T> value) $default, {
    required TResult Function(ProgressNone<T> value) none,
    required TResult Function(ProgressLoading<T> value) loading,
    required TResult Function(ProgressErrorDetails<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressData<T> value)? $default, {
    TResult Function(ProgressNone<T> value)? none,
    TResult Function(ProgressLoading<T> value)? loading,
    TResult Function(ProgressErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProgressErrorDetails<T> extends ProgressResult<T> {
  const factory ProgressErrorDetails(Object error, StackTrace stackTrace) =
      _$ProgressErrorDetails<T>;
  const ProgressErrorDetails._() : super._();

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressErrorDetailsCopyWith<T, ProgressErrorDetails<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ProgressesResultTearOff {
  const _$ProgressesResultTearOff();

  ProgressesData<T> call<T>(List<T> value) {
    return ProgressesData<T>(
      value,
    );
  }

  ProgressesNone<T> none<T>() {
    return ProgressesNone<T>();
  }

  ProgressesLoading<T> loading<T>(List<double> progress) {
    return ProgressesLoading<T>(
      progress,
    );
  }

  ProgressesErrorDetails<T> error<T>(Object error, StackTrace stackTrace) {
    return ProgressesErrorDetails<T>(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $ProgressesResult = _$ProgressesResultTearOff();

/// @nodoc
mixin _$ProgressesResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<T> value) $default, {
    required TResult Function() none,
    required TResult Function(List<double> progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<T> value)? $default, {
    TResult Function()? none,
    TResult Function(List<double> progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressesData<T> value) $default, {
    required TResult Function(ProgressesNone<T> value) none,
    required TResult Function(ProgressesLoading<T> value) loading,
    required TResult Function(ProgressesErrorDetails<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressesData<T> value)? $default, {
    TResult Function(ProgressesNone<T> value)? none,
    TResult Function(ProgressesLoading<T> value)? loading,
    TResult Function(ProgressesErrorDetails<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressesResultCopyWith<T, $Res> {
  factory $ProgressesResultCopyWith(
          ProgressesResult<T> value, $Res Function(ProgressesResult<T>) then) =
      _$ProgressesResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ProgressesResultCopyWithImpl<T, $Res>
    implements $ProgressesResultCopyWith<T, $Res> {
  _$ProgressesResultCopyWithImpl(this._value, this._then);

  final ProgressesResult<T> _value;
  // ignore: unused_field
  final $Res Function(ProgressesResult<T>) _then;
}

/// @nodoc
abstract class $ProgressesDataCopyWith<T, $Res> {
  factory $ProgressesDataCopyWith(
          ProgressesData<T> value, $Res Function(ProgressesData<T>) then) =
      _$ProgressesDataCopyWithImpl<T, $Res>;
  $Res call({List<T> value});
}

/// @nodoc
class _$ProgressesDataCopyWithImpl<T, $Res>
    extends _$ProgressesResultCopyWithImpl<T, $Res>
    implements $ProgressesDataCopyWith<T, $Res> {
  _$ProgressesDataCopyWithImpl(
      ProgressesData<T> _value, $Res Function(ProgressesData<T>) _then)
      : super(_value, (v) => _then(v as ProgressesData<T>));

  @override
  ProgressesData<T> get _value => super._value as ProgressesData<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(ProgressesData<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$ProgressesData<T> extends ProgressesData<T> {
  const _$ProgressesData(this.value) : super._();

  @override
  final List<T> value;

  @override
  String toString() {
    return 'ProgressesResult<$T>(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressesData<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $ProgressesDataCopyWith<T, ProgressesData<T>> get copyWith =>
      _$ProgressesDataCopyWithImpl<T, ProgressesData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<T> value) $default, {
    required TResult Function() none,
    required TResult Function(List<double> progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<T> value)? $default, {
    TResult Function()? none,
    TResult Function(List<double> progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressesData<T> value) $default, {
    required TResult Function(ProgressesNone<T> value) none,
    required TResult Function(ProgressesLoading<T> value) loading,
    required TResult Function(ProgressesErrorDetails<T> value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressesData<T> value)? $default, {
    TResult Function(ProgressesNone<T> value)? none,
    TResult Function(ProgressesLoading<T> value)? loading,
    TResult Function(ProgressesErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ProgressesData<T> extends ProgressesResult<T> {
  const factory ProgressesData(List<T> value) = _$ProgressesData<T>;
  const ProgressesData._() : super._();

  List<T> get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressesDataCopyWith<T, ProgressesData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressesNoneCopyWith<T, $Res> {
  factory $ProgressesNoneCopyWith(
          ProgressesNone<T> value, $Res Function(ProgressesNone<T>) then) =
      _$ProgressesNoneCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ProgressesNoneCopyWithImpl<T, $Res>
    extends _$ProgressesResultCopyWithImpl<T, $Res>
    implements $ProgressesNoneCopyWith<T, $Res> {
  _$ProgressesNoneCopyWithImpl(
      ProgressesNone<T> _value, $Res Function(ProgressesNone<T>) _then)
      : super(_value, (v) => _then(v as ProgressesNone<T>));

  @override
  ProgressesNone<T> get _value => super._value as ProgressesNone<T>;
}

/// @nodoc

class _$ProgressesNone<T> extends ProgressesNone<T> {
  const _$ProgressesNone() : super._();

  @override
  String toString() {
    return 'ProgressesResult<$T>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProgressesNone<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<T> value) $default, {
    required TResult Function() none,
    required TResult Function(List<double> progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<T> value)? $default, {
    TResult Function()? none,
    TResult Function(List<double> progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressesData<T> value) $default, {
    required TResult Function(ProgressesNone<T> value) none,
    required TResult Function(ProgressesLoading<T> value) loading,
    required TResult Function(ProgressesErrorDetails<T> value) error,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressesData<T> value)? $default, {
    TResult Function(ProgressesNone<T> value)? none,
    TResult Function(ProgressesLoading<T> value)? loading,
    TResult Function(ProgressesErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class ProgressesNone<T> extends ProgressesResult<T> {
  const factory ProgressesNone() = _$ProgressesNone<T>;
  const ProgressesNone._() : super._();
}

/// @nodoc
abstract class $ProgressesLoadingCopyWith<T, $Res> {
  factory $ProgressesLoadingCopyWith(ProgressesLoading<T> value,
          $Res Function(ProgressesLoading<T>) then) =
      _$ProgressesLoadingCopyWithImpl<T, $Res>;
  $Res call({List<double> progress});
}

/// @nodoc
class _$ProgressesLoadingCopyWithImpl<T, $Res>
    extends _$ProgressesResultCopyWithImpl<T, $Res>
    implements $ProgressesLoadingCopyWith<T, $Res> {
  _$ProgressesLoadingCopyWithImpl(
      ProgressesLoading<T> _value, $Res Function(ProgressesLoading<T>) _then)
      : super(_value, (v) => _then(v as ProgressesLoading<T>));

  @override
  ProgressesLoading<T> get _value => super._value as ProgressesLoading<T>;

  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(ProgressesLoading<T>(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$ProgressesLoading<T> extends ProgressesLoading<T> {
  const _$ProgressesLoading(this.progress) : super._();

  @override
  final List<double> progress;

  @override
  String toString() {
    return 'ProgressesResult<$T>.loading(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressesLoading<T> &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  $ProgressesLoadingCopyWith<T, ProgressesLoading<T>> get copyWith =>
      _$ProgressesLoadingCopyWithImpl<T, ProgressesLoading<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<T> value) $default, {
    required TResult Function() none,
    required TResult Function(List<double> progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<T> value)? $default, {
    TResult Function()? none,
    TResult Function(List<double> progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressesData<T> value) $default, {
    required TResult Function(ProgressesNone<T> value) none,
    required TResult Function(ProgressesLoading<T> value) loading,
    required TResult Function(ProgressesErrorDetails<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressesData<T> value)? $default, {
    TResult Function(ProgressesNone<T> value)? none,
    TResult Function(ProgressesLoading<T> value)? loading,
    TResult Function(ProgressesErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProgressesLoading<T> extends ProgressesResult<T> {
  const factory ProgressesLoading(List<double> progress) =
      _$ProgressesLoading<T>;
  const ProgressesLoading._() : super._();

  List<double> get progress => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressesLoadingCopyWith<T, ProgressesLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressesErrorDetailsCopyWith<T, $Res> {
  factory $ProgressesErrorDetailsCopyWith(ProgressesErrorDetails<T> value,
          $Res Function(ProgressesErrorDetails<T>) then) =
      _$ProgressesErrorDetailsCopyWithImpl<T, $Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$ProgressesErrorDetailsCopyWithImpl<T, $Res>
    extends _$ProgressesResultCopyWithImpl<T, $Res>
    implements $ProgressesErrorDetailsCopyWith<T, $Res> {
  _$ProgressesErrorDetailsCopyWithImpl(ProgressesErrorDetails<T> _value,
      $Res Function(ProgressesErrorDetails<T>) _then)
      : super(_value, (v) => _then(v as ProgressesErrorDetails<T>));

  @override
  ProgressesErrorDetails<T> get _value =>
      super._value as ProgressesErrorDetails<T>;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ProgressesErrorDetails<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ProgressesErrorDetails<T> extends ProgressesErrorDetails<T> {
  const _$ProgressesErrorDetails(this.error, this.stackTrace) : super._();

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ProgressesResult<$T>.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressesErrorDetails<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stackTrace, stackTrace) ||
                const DeepCollectionEquality()
                    .equals(other.stackTrace, stackTrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stackTrace);

  @JsonKey(ignore: true)
  @override
  $ProgressesErrorDetailsCopyWith<T, ProgressesErrorDetails<T>> get copyWith =>
      _$ProgressesErrorDetailsCopyWithImpl<T, ProgressesErrorDetails<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<T> value) $default, {
    required TResult Function() none,
    required TResult Function(List<double> progress) loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<T> value)? $default, {
    TResult Function()? none,
    TResult Function(List<double> progress)? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ProgressesData<T> value) $default, {
    required TResult Function(ProgressesNone<T> value) none,
    required TResult Function(ProgressesLoading<T> value) loading,
    required TResult Function(ProgressesErrorDetails<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ProgressesData<T> value)? $default, {
    TResult Function(ProgressesNone<T> value)? none,
    TResult Function(ProgressesLoading<T> value)? loading,
    TResult Function(ProgressesErrorDetails<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProgressesErrorDetails<T> extends ProgressesResult<T> {
  const factory ProgressesErrorDetails(Object error, StackTrace stackTrace) =
      _$ProgressesErrorDetails<T>;
  const ProgressesErrorDetails._() : super._();

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressesErrorDetailsCopyWith<T, ProgressesErrorDetails<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

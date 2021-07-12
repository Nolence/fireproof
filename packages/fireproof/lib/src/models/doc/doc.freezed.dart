// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'doc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MaybeDocTearOff {
  const _$MaybeDocTearOff();

  Doc<T> call<T extends Object?>(
      {required DocumentReference<T> reference, required T data}) {
    return Doc<T>(
      reference: reference,
      data: data,
    );
  }

  UnsavedDoc<T> unsaved<T extends Object?>({required T data}) {
    return UnsavedDoc<T>(
      data: data,
    );
  }
}

/// @nodoc
const $MaybeDoc = _$MaybeDocTearOff();

/// @nodoc
mixin _$MaybeDoc<T extends Object?> {
  T get data => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DocumentReference<T> reference, T data) $default, {
    required TResult Function(T data) unsaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DocumentReference<T> reference, T data)? $default, {
    TResult Function(T data)? unsaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Doc<T> value) $default, {
    required TResult Function(UnsavedDoc<T> value) unsaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Doc<T> value)? $default, {
    TResult Function(UnsavedDoc<T> value)? unsaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaybeDocCopyWith<T, MaybeDoc<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaybeDocCopyWith<T extends Object?, $Res> {
  factory $MaybeDocCopyWith(
          MaybeDoc<T> value, $Res Function(MaybeDoc<T>) then) =
      _$MaybeDocCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$MaybeDocCopyWithImpl<T extends Object?, $Res>
    implements $MaybeDocCopyWith<T, $Res> {
  _$MaybeDocCopyWithImpl(this._value, this._then);

  final MaybeDoc<T> _value;
  // ignore: unused_field
  final $Res Function(MaybeDoc<T>) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $DocCopyWith<T extends Object?, $Res>
    implements $MaybeDocCopyWith<T, $Res> {
  factory $DocCopyWith(Doc<T> value, $Res Function(Doc<T>) then) =
      _$DocCopyWithImpl<T, $Res>;
  @override
  $Res call({DocumentReference<T> reference, T data});
}

/// @nodoc
class _$DocCopyWithImpl<T extends Object?, $Res>
    extends _$MaybeDocCopyWithImpl<T, $Res> implements $DocCopyWith<T, $Res> {
  _$DocCopyWithImpl(Doc<T> _value, $Res Function(Doc<T>) _then)
      : super(_value, (v) => _then(v as Doc<T>));

  @override
  Doc<T> get _value => super._value as Doc<T>;

  @override
  $Res call({
    Object? reference = freezed,
    Object? data = freezed,
  }) {
    return _then(Doc<T>(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<T>,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@With.fromString('CastExtension<T>')
class _$Doc<T extends Object?> extends Doc<T> with CastExtension<T> {
  const _$Doc({required this.reference, required this.data}) : super._();

  @override
  final DocumentReference<T> reference;
  @override
  final T data;

  @override
  String toString() {
    return 'MaybeDoc<$T>(reference: $reference, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Doc<T> &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reference) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $DocCopyWith<T, Doc<T>> get copyWith =>
      _$DocCopyWithImpl<T, Doc<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DocumentReference<T> reference, T data) $default, {
    required TResult Function(T data) unsaved,
  }) {
    return $default(reference, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DocumentReference<T> reference, T data)? $default, {
    TResult Function(T data)? unsaved,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(reference, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Doc<T> value) $default, {
    required TResult Function(UnsavedDoc<T> value) unsaved,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Doc<T> value)? $default, {
    TResult Function(UnsavedDoc<T> value)? unsaved,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Doc<T extends Object?> extends MaybeDoc<T>
    implements CastExtension<T> {
  const factory Doc(
      {required DocumentReference<T> reference, required T data}) = _$Doc<T>;
  const Doc._() : super._();

  DocumentReference<T> get reference => throw _privateConstructorUsedError;
  @override
  T get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $DocCopyWith<T, Doc<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsavedDocCopyWith<T extends Object?, $Res>
    implements $MaybeDocCopyWith<T, $Res> {
  factory $UnsavedDocCopyWith(
          UnsavedDoc<T> value, $Res Function(UnsavedDoc<T>) then) =
      _$UnsavedDocCopyWithImpl<T, $Res>;
  @override
  $Res call({T data});
}

/// @nodoc
class _$UnsavedDocCopyWithImpl<T extends Object?, $Res>
    extends _$MaybeDocCopyWithImpl<T, $Res>
    implements $UnsavedDocCopyWith<T, $Res> {
  _$UnsavedDocCopyWithImpl(
      UnsavedDoc<T> _value, $Res Function(UnsavedDoc<T>) _then)
      : super(_value, (v) => _then(v as UnsavedDoc<T>));

  @override
  UnsavedDoc<T> get _value => super._value as UnsavedDoc<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(UnsavedDoc<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@With.fromString('NullableExtension<T>')
class _$UnsavedDoc<T extends Object?> extends UnsavedDoc<T>
    with NullableExtension<T> {
  const _$UnsavedDoc({required this.data}) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'MaybeDoc<$T>.unsaved(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnsavedDoc<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $UnsavedDocCopyWith<T, UnsavedDoc<T>> get copyWith =>
      _$UnsavedDocCopyWithImpl<T, UnsavedDoc<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DocumentReference<T> reference, T data) $default, {
    required TResult Function(T data) unsaved,
  }) {
    return unsaved(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DocumentReference<T> reference, T data)? $default, {
    TResult Function(T data)? unsaved,
    required TResult orElse(),
  }) {
    if (unsaved != null) {
      return unsaved(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Doc<T> value) $default, {
    required TResult Function(UnsavedDoc<T> value) unsaved,
  }) {
    return unsaved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Doc<T> value)? $default, {
    TResult Function(UnsavedDoc<T> value)? unsaved,
    required TResult orElse(),
  }) {
    if (unsaved != null) {
      return unsaved(this);
    }
    return orElse();
  }
}

abstract class UnsavedDoc<T extends Object?> extends MaybeDoc<T>
    implements NullableExtension<T> {
  const factory UnsavedDoc({required T data}) = _$UnsavedDoc<T>;
  const UnsavedDoc._() : super._();

  @override
  T get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $UnsavedDocCopyWith<T, UnsavedDoc<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

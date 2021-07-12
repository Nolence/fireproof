import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doc.freezed.dart';

typedef RestoreFunction<T> = Future<void> Function();

/// To generate updated model code, run:
/// flutter pub run build_runner build
///
@freezed
class MaybeDoc<T extends Object?> with _$MaybeDoc<T> {
  const MaybeDoc._();

  @With.fromString('CastExtension<T>')
  const factory MaybeDoc({
    required DocumentReference<T> reference,
    required T data,
  }) = Doc<T>;

  @With.fromString('NullableExtension<T>')
  const factory MaybeDoc.unsaved({required T data}) = UnsavedDoc<T>;

  static Doc<R?> fromSnapshot<R extends Object?>(
      DocumentSnapshot<R?> snapshot) {
    return Doc<R?>(
      data: snapshot.data(),
      reference: snapshot.reference,
    );
  }

  static Doc<R> fromSnapshotForce<R extends Object?>(
      DocumentSnapshot<R> snapshot) {
    assert(snapshot.exists);

    return Doc<R>(
      data: snapshot.data()!,
      reference: snapshot.reference,
    );
  }

  static Doc<R> fromQuerySnapshot<R extends Object?>(
      QueryDocumentSnapshot<R> snapshot) {
    return Doc<R>(
      data: snapshot.data(),
      reference: snapshot.reference,
    );
  }

  Future<RestoreFunction> delete() async {
    return await when(
      (reference, data) async {
        await reference.delete();

        return () async {
          await reference.set(data);
        };
      },
      unsaved: (_) {
        throw UnsupportedError('You cannot delete an uncommited doc');
      },
    );
  }

  Future<RestoreFunction> set(T value) async {
    return await when(
      (reference, data) async {
        await reference.set(value);

        return () async {
          await reference.set(data);
        };
      },
      unsaved: (_) {
        throw UnsupportedError('You cannot set an uncommited doc');
      },
    );
  }

  Future<RestoreFunction> upsert(T value) async {
    return await when(
      (reference, data) async {
        await reference.set(
          value,
          SetOptions(merge: true),
        );

        return () async {
          await reference.set(data);
        };
      },
      unsaved: (_) {
        throw UnsupportedError('You cannot upsert an uncommited doc');
      },
    );
  }

  String get id => map(
        (value) => value.reference.id,
        unsaved: (value) {
          throw UnsupportedError(
            'You are trying to get the id of an unsaved document',
          );
        },
      );
}

mixin NullableExtension<T extends Object?> on MaybeDoc<T> {
  Future<Doc<T>> commit(DocumentReference<T> reference) async {
    await reference.set(data);

    return Doc(
      data: data,
      reference: reference,
    );
  }
}

/// This is a temp function until
mixin CastExtension<T extends Object?> on MaybeDoc<T> {
  Doc<R> cast<R>({
    required R data,
    required FromFirestore<R> fromFirestore,
    required ToFirestore<R> toFirestore,
  }) {
    return when(
      (reference, _) {
        return Doc<R>(
          data: data,
          reference: reference.withConverter<R>(
            fromFirestore: fromFirestore,
            toFirestore: toFirestore,
          ),
        );
      },
      unsaved: (_) {
        throw UnsupportedError(
          'You cannot cast a null reference to a non-null version',
        );
      },
    );
  }
}

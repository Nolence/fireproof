import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncSnapshotConverter<T> on AsyncSnapshot<T> {
  AsyncValue<T> get toAsyncValue {
    if (hasError) {
      return AsyncError<T>(error!, stackTrace);
    }

    // TODO: This isn't tested and possibly has subtle bugs
    if (connectionState == ConnectionState.waiting ||
        (connectionState == ConnectionState.none && !hasData)) {
      return const AsyncLoading();
    }

    if (hasData) {
      return AsyncData(data!);
    }

    throw StateError('I did not account properly for all the posssible states');
  }
}

extension AsyncValueConverter<T> on AsyncValue<T> {
  AsyncSnapshot<T> get toAsyncSnapshot {
    return when(
      data: (data) {
        return AsyncSnapshot.withData(ConnectionState.done, data);
      },
      loading: () {
        return const AsyncSnapshot.waiting();
      },
      error: (error, stackTrace) {
        if (stackTrace == null) {
          return AsyncSnapshot.withError(ConnectionState.done, error);
        } else {
          return AsyncSnapshot.withError(
            ConnectionState.done,
            error,
            stackTrace,
          );
        }
      },
    );
  }
}

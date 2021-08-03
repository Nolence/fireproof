import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_fireproof_storage/src/file.dart';
import 'package:hooks_fireproof_storage/src/models/commit_result.dart';
import 'package:hooks_fireproof_storage/src/models/progress_result/progress_result.dart';
import 'package:path/path.dart' as path;

StorageFileResult useStorageFile({
  required Reference reference,
  required FileType fileType,
  List<String>? allowedExtensions,

  /// If `true`, the file will have a 5 character hash appended to its name to
  /// ensure it is unique. This may not be desirable however if you'd like the
  /// previous file to be deleted or overwritten.
  ///
  /// Example:
  ///
  /// 'my coolPicture.jpg' -> '6a9h4_my_coolPicture.jpg'
  bool generateUniqueFileName = false,
  SettableMetadata? settableMetadata,
}) {
  final commitProgress = useState<double?>(null);
  final error = useState<Object?>(null);
  final stackTrace = useState<StackTrace?>(null);
  // `useRef` does not trigger a rebuild when the value changes.
  final streamSubscription = useRef<StreamSubscription?>(null);
  final isMounted = useIsMounted();
  final fileResult = useFile(
    fileType: fileType,
    allowedExtensions: allowedExtensions,
  );
  // The path of the file in FirebaseStorage.
  final remoteFilePath = useState<String?>(null);
  final _error = error.value;
  final _stackTrace = stackTrace.value;

  void clearError() {
    error.value = null;
    stackTrace.value = null;
  }

  // TODO: have this return a revert function.
  Future<CommitResult<String>> commit() async {
    final completer = Completer<CommitResult<String>>();
    if (streamSubscription.value != null) {
      completer.completeError('Stream upload already in progress');
    }

    clearError();

    await fileResult.file.maybeWhen(
      (platformFile) async {
        commitProgress.value = 0.0;

        try {
          final filePathName = platformFile.name;
          final uniqueKey = UniqueKey();
          var fileName =
              path.basename(filePathName).replaceAll(RegExp(r'\s+'), '_');

          if (generateUniqueFileName) {
            fileName = '${shortHash(uniqueKey)}_$fileName';
          }

          final bucketName = reference.bucket;
          final childReference = reference.child(fileName);
          final fileLocation = 'gs://$bucketName/${childReference.fullPath}';
          final UploadTask uploadTask;

          // TODO: Check if file exists with current name. It won't

          // Web must work off bytes, no filePath
          if (kIsWeb) {
            uploadTask = childReference.putData(
              platformFile.bytes!,
              settableMetadata,
            );
          } else {
            final filePath = platformFile.path!;

            uploadTask = childReference.putFile(
              File(filePath),
              settableMetadata,
            );
          }

          streamSubscription.value = uploadTask.snapshotEvents.listen(
            (TaskSnapshot snapshot) {
              commitProgress.value =
                  snapshot.bytesTransferred / snapshot.totalBytes;
            },
            onError: (Object _error, StackTrace _stackTrace) {
              error.value = _error;
              stackTrace.value = _stackTrace;
            },
            onDone: () {
              remoteFilePath.value = fileLocation;
            },
            cancelOnError: true,
          );

          await uploadTask;
          completer.complete(
            CommitResult(
              fileLocation,
              () async {
                // delete the current file, if previous upload that.
              },
            ),
          );
        } catch (_error, _stackTrace) {
          completer.completeError(error, _stackTrace);
          error.value = _error;
          stackTrace.value = _stackTrace;
        } finally {
          streamSubscription.value?.cancel();
          streamSubscription.value = null;

          if (isMounted()) {
            commitProgress.value = null;
          }
        }
      },
      orElse: () {
        completer.completeError(
          StateError(
            'Cannot commit a file that has not been selected yet.',
          ),
        );
      },
    );

    return completer.future;
  }

  final _remoteFilePath = remoteFilePath.value;
  final _commitProgress = commitProgress.value;
  final ProgressResult<String> commitResult;

  if (_commitProgress != null) {
    commitResult = ProgressResult.loading(_commitProgress);
  } else if (_remoteFilePath != null) {
    commitResult = ProgressResult<String>(_remoteFilePath);
  } else if (_error != null && _stackTrace != null) {
    commitResult = ProgressResult<String>.error(_error, _stackTrace);
  } else {
    assert(_error == null && _stackTrace == null);
    commitResult = const ProgressResult<String>.none();
  }

  return StorageFileResult(
    commit,
    fileResult,
    commitResult,
  );
}

@immutable
class StorageFileResult {
  const StorageFileResult(
    this.commit,
    this.fileResult,
    this.commitResult,
  );

  final Future<CommitResult<String>> Function() commit;

  final FileResult fileResult;

  final ProgressResult<String> commitResult;
}

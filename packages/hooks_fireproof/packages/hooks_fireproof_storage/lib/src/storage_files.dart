import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_fireproof_storage/src/files.dart';
import 'package:hooks_fireproof_storage/src/models/commit_result.dart';
import 'package:hooks_fireproof_storage/src/models/progress_result/progress_result.dart';
import 'package:path/path.dart' as path;

/// A hook to allow users to select multiple files and appropriately commit them
/// to Firebase Storage.
StorageFilesResult useStorageFiles({
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
  final commitProgresses = useState<List<double>?>(null);
  final error = useState<Object?>(null);
  final stackTrace = useState<StackTrace?>(null);
  // `useRef` does not trigger a rebuild when the value changes.
  final streamSubscriptions = useRef<List<StreamSubscription>?>(null);
  final isMounted = useIsMounted();
  final filesResult = useFiles(
    fileType: fileType,
    allowedExtensions: allowedExtensions,
  );
  // The path of the file in FirebaseStorage.
  final remoteFilePaths = useState<List<String>?>(null);
  final _error = error.value;
  final _stackTrace = stackTrace.value;

  void clearError() {
    error.value = null;
    stackTrace.value = null;
  }

  // TODO: have this return a revert function.
  Future<CommitResult<List<String>>> commit() async {
    final completer = Completer<CommitResult<List<String>>>();
    if (streamSubscriptions.value != null) {
      completer.completeError('Stream upload already in progress');
    }

    clearError();

    await filesResult.files.maybeWhen(
      (platformFiles) async {
        final bucketName = reference.bucket;
        commitProgresses.value = List.generate(
          platformFiles.length,
          (_) => 0.0,
        );
        remoteFilePaths.value = List.generate(
          platformFiles.length,
          (_) => '',
        );

        try {
          final uploadTasks = <UploadTask>[];
          final uploadPaths = <String>[];

          for (var i = 0; i < platformFiles.length; i++) {
            final platformFile = platformFiles[i];
            final filePathName = platformFile.name;
            final uniqueKey = UniqueKey();
            var fileName =
                path.basename(filePathName).replaceAll(RegExp(r'\s+'), '_');

            if (generateUniqueFileName) {
              fileName = '${shortHash(uniqueKey)}_$fileName';
            }

            final childReference = reference.child(fileName);
            final fileLocation = 'gs://$bucketName/${childReference.fullPath}';

            uploadPaths.add(fileLocation);

            // Web must work off bytes, no filePath
            if (kIsWeb) {
              uploadTasks.add(
                childReference.putData(
                  platformFile.bytes!,
                  settableMetadata,
                ),
              );
            } else {
              final filePath = platformFile.path!;

              uploadTasks.add(
                childReference.putFile(
                  File(filePath),
                  settableMetadata,
                ),
              );
            }

            final uploadTask = uploadTasks[i];
            final _streamSubscriptions = streamSubscriptions.value;

            if (_streamSubscriptions != null) {
              _streamSubscriptions.add(
                uploadTask.snapshotEvents.listen(
                  (TaskSnapshot snapshot) {
                    commitProgresses.value = [...commitProgresses.value!]
                      ..replaceRange(
                        i,
                        i + 1,
                        [snapshot.bytesTransferred / snapshot.totalBytes],
                      );
                  },
                  onError: (Object _error, StackTrace _stackTrace) {
                    completer.completeError(_error, _stackTrace);
                    error.value = _error;
                    stackTrace.value = _stackTrace;
                  },
                  onDone: () {
                    // FIXME: Check if all of them are complete before calling
                    // complete.
                    remoteFilePaths.value = [...remoteFilePaths.value!]
                      ..replaceRange(i, i + 1, [fileLocation]);
                  },
                  cancelOnError: true,
                ),
              );
            }

            await Future.wait(uploadTasks);
            completer.complete(
              CommitResult(
                uploadPaths,
                () async {},
              ),
            );
          }
        } catch (_error, _stackTrace) {
          error.value = _error;
          stackTrace.value = _stackTrace;
        } finally {
          streamSubscriptions.value?.map((subscription) {
            subscription.cancel();
          });
          streamSubscriptions.value = null;

          if (isMounted()) {
            commitProgresses.value = null;
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

  final _remoteFilePaths = remoteFilePaths.value;
  final _commitProgresses = commitProgresses.value;
  final ProgressesResult<String> commitResult;

  if (_commitProgresses != null) {
    commitResult = ProgressesResult.loading(_commitProgresses);
  } else if (_remoteFilePaths != null) {
    commitResult = ProgressesResult<String>(_remoteFilePaths);
  } else if (_error != null && _stackTrace != null) {
    commitResult = ProgressesResult<String>.error(_error, _stackTrace);
  } else {
    assert(_error == null && _stackTrace == null);
    commitResult = const ProgressesResult<String>.none();
  }

  return StorageFilesResult(
    commit,
    filesResult,
    commitResult,
  );
}

@immutable
class StorageFilesResult {
  const StorageFilesResult(
    this.commit,
    this.filesResult,
    this.commitResults,
  );

  final Future<CommitResult<List<String>>> Function() commit;

  final FilesResult filesResult;

  final ProgressesResult<String> commitResults;
}

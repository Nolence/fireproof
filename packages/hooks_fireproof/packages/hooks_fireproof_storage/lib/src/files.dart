import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_fireproof_storage/src/models/result/result.dart';

/// Uses `file_picker` to pick multiple files and returns them. Loading, error
/// and data states are handled through the [Result] type.
FilesResult useFiles({
  required FileType fileType,
  List<String>? allowedExtensions,
}) {
  final filePickerResult = useState<FilePickerResult?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Object?>(null);
  final stackTrace = useState<StackTrace?>(null);
  final isMounted = useIsMounted();

  void clearError() {
    error.value = null;
    stackTrace.value = null;
  }

  final _error = error.value;
  final _stackTrace = stackTrace.value;

  Future<List<PlatformFile>?> selectFiles() async {
    clearError();
    isLoading.value = true;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowedExtensions: allowedExtensions,
        allowMultiple: true,
      );

      if (result != null && isMounted()) {
        filePickerResult.value = result;
        return result.files;
      }
    } catch (_error, _stackTrace) {
      error.value = _error;
      stackTrace.value = _stackTrace;
      // TODO: Should i rethrow?
      rethrow;
    } finally {
      if (isMounted()) {
        isLoading.value = false;
      }
    }
  }

  final filePickerValue = filePickerResult.value;
  final Result<List<PlatformFile>> fileResult;

  if (isLoading.value) {
    fileResult = const Result<List<PlatformFile>>.loading();
  } else if (filePickerValue != null) {
    fileResult = Result<List<PlatformFile>>(filePickerValue.files);
  } else if (_error != null && _stackTrace != null) {
    fileResult = Result<List<PlatformFile>>.error(_error, _stackTrace);
  } else {
    assert(_error == null && _stackTrace == null);
    fileResult = const Result<List<PlatformFile>>.none();
  }

  return FilesResult(selectFiles, fileResult);
}

@immutable
class FilesResult {
  const FilesResult(this.selectFiles, this.files);

  final Future<List<PlatformFile>?> Function() selectFiles;

  final Result<List<PlatformFile>> files;
}

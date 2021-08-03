import 'package:file_picker/file_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_fireproof_storage/src/models/result/result.dart';
import 'package:meta/meta.dart';

/// Uses `file_picker` to pick a file and returns that file as [PlatformFile].
/// Loading, error and data states are handled through the [Result] type.
FileResult useFile({
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

  Future<PlatformFile?> selectFile() async {
    clearError();
    isLoading.value = true;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowedExtensions: allowedExtensions,
        allowMultiple: false,
      );

      if (result != null && isMounted()) {
        filePickerResult.value = result;
        return result.files.single;
      }
    } catch (_error, _stackTrace) {
      error.value = _error;
      stackTrace.value = _stackTrace;
      rethrow;
    } finally {
      if (isMounted()) {
        isLoading.value = false;
      }
    }
  }

  final filePickerValue = filePickerResult.value;
  final Result<PlatformFile> fileResult;

  if (isLoading.value) {
    fileResult = const Result<PlatformFile>.loading();
  } else if (filePickerValue != null) {
    fileResult = Result<PlatformFile>(filePickerValue.files.single);
  } else if (_error != null && _stackTrace != null) {
    fileResult = Result<PlatformFile>.error(_error, _stackTrace);
  } else {
    assert(_error == null && _stackTrace == null);
    fileResult = const Result<PlatformFile>.none();
  }

  return FileResult(selectFile, fileResult);
}

@immutable
class FileResult {
  const FileResult(this.selectFile, this.file);

  final Future<PlatformFile?> Function() selectFile;

  final Result<PlatformFile> file;
}

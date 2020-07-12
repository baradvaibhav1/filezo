import 'dart:io';

import 'package:fileexplorer/enums/file_categories.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';

class FileUIUtils {
  static String getFileIcon(String path) {
    File f = File(path);
    String _extension = extension(f.path).toLowerCase();
    String mimeType = mime(basename(path).toLowerCase());
    String type = mimeType == null ? "" : mimeType.split("/")[0];

    if (_extension == ".apk") {
      return "assets/images/apk_file.png";
    } else if (_extension == ".crdownload") {
      return "assets/images/unrecognized_file.png";
    } else if (_extension == ".zip" || _extension.contains("tar")) {
      return "assets/images/unrecognized_file.png";
    } else if (_extension == ".epub" ||
        _extension == ".pdf" ||
        _extension == ".mobi") {
      return "assets/images/doc_file.png";
    } else {
      switch (type) {
        case "image":
          return "assets/images/video_file.png";
        case "video":
          return "assets/images/video_file.png";
        case "audio":
          return "assets/images/music_file.png";
        case "text":
          return "assets/images/unrecognized_file.png";
        default:
          return "assets/images/unrecognized_file.png";
      }
    }
  }


  static String getFileIconFromCategory(FileCategory category) {
      switch (category) {
        case FileCategory.Image:
          return "assets/images/video_file.png";
        case FileCategory.Video:
          return "assets/images/video_file.png";
        case FileCategory.Audio:
          return "assets/images/music_file.png";
        case FileCategory.Doc:
          return "assets/images/doc_file.png";
        case FileCategory.Archive:
          return "assets/images/unrecognized_file.png";
        case FileCategory.APK:
          return "assets/images/apk_file.png";
        default:
          return "assets/images/unrecognized_file.png";
      }
  }


  static FileCategory sortCategory(String path) {
    File f = File(path);
    String _extension = extension(f.path).toLowerCase();
    String mimeType = mime(basename(path).toLowerCase());
    String type = mimeType == null ? "" : mimeType.split("/")[0];

    if (_extension == ".apk") {
      return FileCategory.APK;
    } else if (_extension == ".crdownload") {
      return FileCategory.Unknown;
    } else if (_extension == ".zip" || _extension.contains("tar")) {
      return FileCategory.Archive;

    } else if (_extension == ".epub" ||
        _extension == ".pdf" ||
        _extension == ".mobi") {
      return FileCategory.Doc;
    } else {
      switch (type) {
        case "image":
          return FileCategory.Image;
        case "video":
          return FileCategory.Video;
        case "audio":
          return FileCategory.Audio;
        case "text":
          return FileCategory.Doc;
        default:
          return FileCategory.Unknown;
      }
    }
  }
}

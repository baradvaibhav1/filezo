import 'dart:io';

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
          {
            return "assets/images/video_file.png";
          }
          break;

        case "video":
          {
            return "assets/images/video_file.png";
          }
          break;

        case "audio":
          {
            return "assets/images/music_file.png";
          }
          break;

        case "text":
          {
            return "assets/images/unrecognized_file.png";
          }
          break;

        default:
          {
            return "assets/images/unrecognized_file.png";
          }
          break;
      }
    }
  }
}

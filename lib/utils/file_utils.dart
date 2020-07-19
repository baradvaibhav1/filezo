import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static String waPath = "/storage/emulated/0/WhatsApp/Media/.Statuses";
  static Uint8List placeHolder;

  static loadPlaceHolder() async {
    placeHolder = (await rootBundle.load("assets/images/placeholder.png"))
        .buffer
        .asUint8List();
  }

  /// Convert Byte to KB, MB, .......
  static String formatBytes(bytes, decimals) {
    if (bytes == 0) return "0.0 KB";
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }

  /// Get mime information of a file
  static String getMime(String path) {
    File file = File(path);
    String mimeType = mime(file.path);
    return mimeType;
  }

  /// Return all available Storage path
  static Future<List<Directory>> getStorageList() async {
    List<Directory> paths = await getExternalStorageDirectories();
    List<Directory> filteredPaths = List<Directory>();
    for (Directory dir in paths) {
      filteredPaths.add(removeDataDirectory(dir.path));
    }
    return filteredPaths;
  }

  static Future<BlazeFileEntity> getBlazeEntity( //cannot measure folder size
      FileSystemEntity fileSystemEntity) async {
    if (fileSystemEntity is File) {
      var category = FileUIUtils.sortCategory(fileSystemEntity.path);
//      var isImage = category == FileCategory.Image ? true : false;
      return BlazeFileEntity(
        fileEntityType: FileEntityType.File,
        path: fileSystemEntity.path,
        basename: basenameWithoutExtension(fileSystemEntity.path),
        extension: extension(fileSystemEntity.path),
        name: basename(fileSystemEntity.path),
        mime: mime(fileSystemEntity.path),
        size: FileUtils.formatBytes(await fileSystemEntity.length(), 2),
        timestamp: (await fileSystemEntity.lastAccessed()).toIso8601String(),
        category: category,
        file: fileSystemEntity,
        /*imageHeight: height,
        imageWidth: width,
        cacheHeight: (height * cacheRatio).floor(),
        cacheWidth: (width * cacheRatio).floor(),*/
      );
    } else {
      var dir = Directory(fileSystemEntity.path);
      var stat = await FileStat.stat(fileSystemEntity.path);
      return BlazeFileEntity(
        fileEntityType: FileEntityType.Folder,
        path: fileSystemEntity.path,
        name: basename(fileSystemEntity.path),
        basename: basename(fileSystemEntity.path),
        timestamp: stat.accessed.toIso8601String(),
        filesInsideCount: (await dir.list().length),
      );
    }
  }

  static BlazeFileEntity getBlazeEntitySync(FileSystemEntity fileSystemEntity) {
    if (fileSystemEntity is File) {
      var category = FileUIUtils.sortCategory(fileSystemEntity.path);
//      var isImage = category == FileCategory.Image ? true : false;
      return BlazeFileEntity(
        fileEntityType: FileEntityType.File,
        path: fileSystemEntity.path,
        basename: basenameWithoutExtension(fileSystemEntity.path),
        extension: extension(fileSystemEntity.path),
        name: basename(fileSystemEntity.path),
        mime: mime(fileSystemEntity.path),
        size: FileUtils.formatBytes(fileSystemEntity.lengthSync(), 2),
        timestamp: (fileSystemEntity.lastAccessedSync()).toIso8601String(),
        category: category,
        file: fileSystemEntity,
      );
    } else {
      var dir = Directory(fileSystemEntity.path);
      var stat = FileStat.statSync(fileSystemEntity.path);
      var list = dir.listSync();
      var items = list.length;
      int size = 0;
      dir
          .listSync(recursive: true, followLinks: false)
          .forEach((FileSystemEntity entity) {
        if (entity is File) {
          size += entity.lengthSync();
        }
      });

      return BlazeFileEntity(
        fileEntityType: FileEntityType.Folder,
        path: fileSystemEntity.path,
        name: basename(fileSystemEntity.path),
        basename: basename(fileSystemEntity.path),
        timestamp: stat.accessed.toIso8601String(),
        filesInsideCount: items,
        size: FileUtils.formatBytes(size, 2),
      );
    }
  }

  static bool isHidden(FileSystemEntity file) {
    if (getExactDirectory(file.path).toLowerCase().contains("whatsapp images"))
      return false;

    if (basename(file.path).startsWith(".") ||
        file.path.contains("/.") ||
        (file.path.contains("/Android")) ||
        file.path.toLowerCase().contains("/private") ||
        (file.path.toLowerCase().contains("whatsapp"))) return true;

    return false;
  }

  static bool isLegitHidden(FileSystemEntity file) {
    if (basename(file.path).startsWith(".") ||
        file.path.contains("/.") ||
        (file.path.contains("/Android"))) return true;

    return false;
  }

  static bool isBlazeHidden(BlazeFileEntity file) {
    if (basename(file.path).startsWith(".")) return true;
    return false;
  }

  static bool isBlazeFolder(BlazeFileEntity file) {
    if (file.fileEntityType == FileEntityType.Folder) return true;

    return false;
  }

  static bool isBlazeImage(BlazeFileEntity file) {
    if (file.category == FileCategory.Image) return true;

    return false;
  }

  static Directory removeDataDirectory(String path) {
    return Directory(path.split("Android")[0]);
  }

  static Future<List<FileSystemEntity>> getFilesInPath(String path) async {
    Directory dir = Directory(path);
    return dir.listSync();
  }

  static Future<List<FileSystemEntity>> getVolumeFiles(
      {bool showHidden = false,
      Directory storageVolume,
      bool withDirectory = true}) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = storageVolume.list(recursive: true);
    lister.listen((file) => withDirectory ? files.add(file) : {},
        // should also register onError
        onDone: () => completer.complete(files));
    return completer.future;
  }

  static Future<List<FileSystemEntity>> getAllFiles(
      {bool showHidden,
      List<FileSystemEntity> storageVolumes,
      bool withDirectory = true}) async {
    List<FileSystemEntity> files = [];

    List<FileSystemEntity> storageDirs =
        storageVolumes ?? await getStorageList();

    for (var volume in storageDirs) {
      List<FileSystemEntity> list = await getVolumeFiles(
          showHidden: showHidden,
          storageVolume: volume,
          withDirectory: withDirectory);
      files.addAll(list);
    }
    return files;
  }

  static Future<List<FileSystemEntity>> getRecentFiles(
      {bool showHidden}) async {
    List<FileSystemEntity> files =
        await getAllFiles(showHidden: showHidden, withDirectory: false);
    files.sort((a, b) => File(a.path)
        .lastAccessedSync()
        .compareTo(File(b.path).lastAccessedSync()));
    return files.reversed.toList();
  }

  static Future<List<FileSystemEntity>> searchFiles(String query,
      {bool showHidden}) async {
    List<Directory> storage = await getStorageList();
    List<FileSystemEntity> files = List<FileSystemEntity>();
    for (Directory dir in storage) {
      List fs = await getAllFilesInPath(dir.path, showHidden: showHidden);
      for (FileSystemEntity fs in fs) {
        if (basename(fs.path).toLowerCase().contains(query.toLowerCase())) {
          files.add(fs);
        }
      }
    }
    return files;
  }

  /// Get all files
  static Future<List<FileSystemEntity>> getAllFilesInPath(String path,
      {bool showHidden}) async {
    List<FileSystemEntity> files = List<FileSystemEntity>();
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        if (!showHidden) {
          if (!basename(file.path).startsWith(".")) {
            files.add(file);
          }
        } else {
          files.add(file);
        }
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
//          print(file.path);
          if (!showHidden) {
            if (!basename(file.path).startsWith(".")) {
              files.addAll(
                  await getAllFilesInPath(file.path, showHidden: showHidden));
            }
          } else {
            files.addAll(
                await getAllFilesInPath(file.path, showHidden: showHidden));
          }
        }
      }
    }
//    print(files);
    return files;
  }

/*  static Future<List<BlazeFileEntity>> dirContents(
      {bool showHidden = false, Directory dir, bool withDirectory = true}) {
    var files = <BlazeFileEntity>[];
    var completer = Completer<List<BlazeFileEntity>>();
    var lister = dir.list(recursive: false);
    lister.listen((file) async => files.add(await FileUtils.getBlazeEntity(file)),
        // should also register onError
        onDone: () => completer.complete(files));
    return completer.future;
  }*/

  static Future<List<BlazeFileEntity>> getBlazeInPath(
      {bool showHidden = false,
      Directory dir,
      bool withDirectory = true}) async {
    var files = <BlazeFileEntity>[];

    await dir
        .list(recursive: false)
        .where((file) => !isLegitHidden(file))
        .forEach((f) async {
      var blazeFileEntity = await FileUtils.getBlazeEntity(f);
      print(blazeFileEntity.path);

      await files.add(blazeFileEntity);
    });

    return files;
  }

  static String formatTime(String iso) {
    DateTime date = DateTime.parse(iso);
    DateTime now = DateTime.now();
    DateTime yDay = DateTime.now().subtract(Duration(days: 1));
    DateTime dateFormat = DateTime.parse(
        "${date.year}-${date.month.toString().padLeft(2, "0")}-${date.day.toString().padLeft(2, "0")}T00:00:00.000Z");
    DateTime today = DateTime.parse(
        "${now.year}-${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")}T00:00:00.000Z");
    DateTime yesterday = DateTime.parse(
        "${yDay.year}-${yDay.month.toString().padLeft(2, "0")}-${yDay.day.toString().padLeft(2, "0")}T00:00:00.000Z");

    if (dateFormat == today) {
      return "Today ${DateFormat("HH:mm").format(date)}";
    } else if (dateFormat == yesterday) {
      return "Yesterday ${DateFormat("HH:mm").format(date)}";
    } else {
      return "${DateFormat("dd MMM yy, HH:mm").format(date)}";
    }
  }

  static String formatTimeFromEpoch(int iso) {
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(iso);
    DateTime now = DateTime.now();
    DateTime yDay = DateTime.now().subtract(Duration(days: 1));
    DateTime dateFormat = DateTime.parse(
        "${date.year}-${date.month.toString().padLeft(2, "0")}-${date.day.toString().padLeft(2, "0")}T00:00:00.000Z");
    DateTime today = DateTime.parse(
        "${now.year}-${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")}T00:00:00.000Z");
    DateTime yesterday = DateTime.parse(
        "${yDay.year}-${yDay.month.toString().padLeft(2, "0")}-${yDay.day.toString().padLeft(2, "0")}T00:00:00.000Z");

    if (dateFormat == today) {
      return "Today ${DateFormat("HH:mm").format(date)}";
    } else if (dateFormat == yesterday) {
      return "Yesterday ${DateFormat("HH:mm").format(date)}";
    } else {
      return "${DateFormat("MMM dd, HH:mm").format(date)}";
    }
  }

  static List<FileSystemEntity> sortList(
      List<FileSystemEntity> list, int sort) {
    switch (sort) {
      case 0:
        if (list.toString().contains("Directory")) {
          list
            ..sort((f1, f2) => basename(f1.path)
                .toLowerCase()
                .compareTo(basename(f2.path).toLowerCase()));
          return list
            ..sort((f1, f2) => f1
                .toString()
                .split(":")[0]
                .toLowerCase()
                .compareTo(f2.toString().split(":")[0].toLowerCase()));
        } else {
          return list
            ..sort((f1, f2) => basename(f1.path)
                .toLowerCase()
                .compareTo(basename(f2.path).toLowerCase()));
        }
        break;

      case 1:
        list.sort((f1, f2) => basename(f1.path)
            .toLowerCase()
            .compareTo(basename(f2.path).toLowerCase()));
        if (list.toString().contains("Directory")) {
          list
            ..sort((f1, f2) => f1
                .toString()
                .split(":")[0]
                .toLowerCase()
                .compareTo(f2.toString().split(":")[0].toLowerCase()));
        }
        return list.reversed.toList();
        break;

      case 2:
        return list
          ..sort((f1, f2) => FileSystemEntity.isFileSync(f1.path) &&
                  FileSystemEntity.isFileSync(f2.path)
              ? File(f1.path)
                  .lastModifiedSync()
                  .compareTo(File(f2.path).lastModifiedSync())
              : 1);
        break;

      case 3:
        list
          ..sort((f1, f2) => FileSystemEntity.isFileSync(f1.path) &&
                  FileSystemEntity.isFileSync(f2.path)
              ? File(f1.path)
                  .lastModifiedSync()
                  .compareTo(File(f2.path).lastModifiedSync())
              : 1);
        return list.reversed.toList();
        break;

      case 4:
        list
          ..sort((f1, f2) => FileSystemEntity.isFileSync(f1.path) &&
                  FileSystemEntity.isFileSync(f2.path)
              ? File(f1.path).lengthSync().compareTo(File(f2.path).lengthSync())
              : 0);
        return list.reversed.toList();
        break;

      case 5:
        return list
          ..sort((f1, f2) => FileSystemEntity.isFileSync(f1.path) &&
                  FileSystemEntity.isFileSync(f2.path)
              ? File(f1.path).lengthSync().compareTo(File(f2.path).lengthSync())
              : 0);
        break;

      default:
        return list..sort();
    }
  }

  static String getExactDirectory(String path) {
    var pathArr = dirname(path).split('/');
    return pathArr[pathArr.length - 1];
  }
}

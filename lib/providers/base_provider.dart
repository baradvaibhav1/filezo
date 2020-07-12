import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class BaseProvider extends ChangeNotifier {
  static const int RECENT_FILES_MAX = 30;

  List<Directory> storageVolumePaths = List(); //the mounted storage volumes
  List<StorageBoxData> storageBoxes = List();
  List<BlazeFileEntity> allFileEntities = List();
  List<BlazeFileEntity> allFiles = List();

  List<BlazeFileEntity> recentFiles = List();

  List<BlazeFileEntity> audioList = [];

  List<BlazeFileEntity> imagesList = [];
  List<BlazeFileEntity> videosList = [];
  List<BlazeFileEntity> apksList = [];
  List<BlazeFileEntity> screenshotsList = [];
  List<BlazeFileEntity> archivesList = [];
  List<BlazeFileEntity> downloadsList = [];
  List<BlazeFileEntity> docsList = [];
  List<BlazeFileEntity> unknownList = [];
  List<BlazeFileEntity> recognizedList = [];

  ViewState viewState = ViewState.Free;
  bool initLoadingComplete = false;


  BaseProvider() {
    //checkSpace();
  }

  checkSpace() async {
    setLoading(ViewState.BackgroundLoading);
    await FileUtils.loadPlaceHolder();
    print("Placeholder Loaded");
    recentFiles.clear();
    storageVolumePaths.clear();
    storageBoxes.clear();
    storageVolumePaths = await FileUtils.getStorageList();
    print(storageVolumePaths);

    await getAllFiles(storageVolumes: storageVolumePaths);
    print(allFileEntities.length);
    print("Files Only : ${allFiles.length}");
    print("Images Count : ${imagesList.length}");
    print("Docs Count : ${docsList.length}");
    print("Unknown Count : ${unknownList.length}");
    print("Recognizedd Count : ${recognizedList.length}");
    await sortFiles();
    print("Sorting Done");
    await getRecentFiles();
    print(recentFiles);
    initLoadingComplete = true;
    setLoading(ViewState.Free);
    notifyListeners();

    //MethodChannel platform = MethodChannel('dev.jideguru.filex/storage');
/*
    var free = await platform.invokeMethod("getStorageFreeSpace");
    var total = await platform.invokeMethod("getStorageTotalSpace");
    setFreeSpace(free);
    setTotalSpace(total);
    setUsedSpace(total - free);

    if (l.length > 1) {
      var freeSD = await platform.invokeMethod("getExternalStorageFreeSpace");
      var totalSD = await platform.invokeMethod("getExternalStorageTotalSpace");
      setFreeSDSpace(freeSD);
      setTotalSDSpace(totalSD);
      setUsedSDSpace(totalSD - freeSD);
    }*/
    //getRecentFiles();
  }

  categorizeFile(BlazeFileEntity file) async {
    var type = file.category;

    if (type != FileCategory.Unknown) recognizedList.add(file);

    switch (type) {
      case FileCategory.Image:
        imagesList.add(file);
        break;
      case FileCategory.Audio:
        audioList.add(file);
        break;
      case FileCategory.Doc:
        docsList.add(file);
        break;
      case FileCategory.Video:
        videosList.add(file);
        break;
      case FileCategory.Archive:
        archivesList.add(file);
        break;
      case FileCategory.APK:
        apksList.add(file);
        break;
      default:
        unknownList.add(file);
        break;
    }
  }

  setLoading(ViewState state) {
    viewState = state;
  }

  Future getVolumeFiles(
      {bool showHidden = false,
      Directory storageVolume,
      bool withDirectory = true}) async {
    print("Storage Volume : $storageVolume");
    var files = <BlazeFileEntity>[];

    var dir = storageVolume;

    await dir
        .list(recursive: true)
        .where((file) => !FileUtils.isHidden(file))
        .forEach((f) async {
      var blazeFileEntity = await FileUtils.getBlazeEntity(f);

      if (FileUtils.isBlazeFolder(blazeFileEntity)) {
        allFileEntities.add(blazeFileEntity);
      } else {
        allFileEntities.add(blazeFileEntity);
        allFiles.add(blazeFileEntity);

        categorizeFile(blazeFileEntity);
      }
    });
  }

  Future<List<BlazeFileEntity>> getAllFiles(
      {bool showHidden = false,
      List<FileSystemEntity> storageVolumes,
      bool withDirectory = true}) async {
    List<BlazeFileEntity> files = [];

    List<FileSystemEntity> storageDirs =
        storageVolumes ?? await FileUtils.getStorageList();

    print("Storage");
    print(storageDirs);

    for (var volume in storageDirs) {
      await getVolumeFiles(
          showHidden: showHidden,
          storageVolume: volume,
          withDirectory: withDirectory);
    }
    return files;
  }

  Future sortFiles() async {
    await audioList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    audioList = await audioList.reversed.toList();

    await imagesList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    imagesList = await imagesList.reversed.toList();

    await docsList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    docsList = await docsList.reversed.toList();

    await videosList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    videosList = await videosList.reversed.toList();

    await apksList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    apksList = await apksList.reversed.toList();

    await archivesList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    archivesList = await archivesList.reversed.toList();

    await recognizedList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    recognizedList = await recognizedList.reversed.toList();

    return;
  }

  Future getRecentFiles() async {
    recentFiles.clear();
    await recentFiles.addAll(recognizedList.sublist(
        0,
        recognizedList.length >= RECENT_FILES_MAX
            ? RECENT_FILES_MAX
            : recognizedList.length));
  }
}

import 'dart:io';

import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class BaseProvider extends ChangeNotifier {
  List<Directory> storageVolumePaths = List(); //the mounted storage volumes
  List<StorageBoxData> storageBoxes = List();
  List<FileSystemEntity> allFileEntities = List();
  List<FileSystemEntity> allFiles = List();

  List<FileSystemEntity> recentFiles = List();

  ViewState viewState = ViewState.Free;

  List<File> audioList = [];
  List<File> imagesList = [];
  List<File> videosList = [];
  List<File> apksList = [];
  List<File> screenshotsList = [];
  List<File> archivesList = [];
  List<File> downloadsList = [];
  List<File> docsList = [];
  List<File> unknownList = [];

  BaseProvider() {
    //checkSpace();
  }

  checkSpace() async {
    setLoading(ViewState.Loading);
    recentFiles.clear();
    storageVolumePaths.clear();
    storageBoxes.clear();
    storageVolumePaths = await FileUtils.getStorageList();
    print(storageVolumePaths);

    allFileEntities = await FileUtils.getAllFiles(
        storageVolumes: storageVolumePaths, showHidden: true);
    print(allFileEntities.length);
    await pruneFiles();
    print("Files Only : ${allFiles.length}");
    await categorizeFiles();
    print("Images Count : ${imagesList.length}");
    print("Docs Count : ${docsList.length}");
    print("Unknown Count : ${unknownList.length}");
    await getRecentFiles();
    print(recentFiles);
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

  pruneFiles() async {
    allFiles = allFileEntities.where((element) => element is File).toList();
  }

  categorizeFiles() async {
    allFiles.forEach((file) {
      var type = FileUIUtils.sortCategory(file.path);

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
    });
  }

  getRecentFiles() async {
    setLoading(ViewState.Loading);
    recentFiles = allFiles.sublist(allFiles.length - 20, allFiles.length);
  }

  setLoading(ViewState state) {
    viewState = state;
  }
}

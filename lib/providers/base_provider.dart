import 'dart:async';
import 'dart:io';

import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class BaseProvider extends ChangeNotifier {
  List<Directory> storageVolumePaths = List(); //the mounted storage volumes
  List<StorageBoxData> storageBoxes = List();
  List<BlazeFileEntity> allFileEntities = List();
  List<BlazeFileEntity> allFiles = List();

  List<BlazeFileEntity> recentFiles = List();

  ViewState viewState = ViewState.Free;

  List<BlazeFileEntity> audioList = [];
  List<BlazeFileEntity> imagesList = [];
  List<BlazeFileEntity> videosList = [];
  List<BlazeFileEntity> apksList = [];
  List<BlazeFileEntity> screenshotsList = [];
  List<BlazeFileEntity> archivesList = [];
  List<BlazeFileEntity> downloadsList = [];
  List<BlazeFileEntity> docsList = [];
  List<BlazeFileEntity> unknownList = [];

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

    await getAllFiles(storageVolumes: storageVolumePaths);
    print(allFileEntities.length);
    print("Files Only : ${allFiles.length}");
    print("Images Count : ${imagesList.length}");
    print("Docs Count : ${docsList.length}");
    print("Unknown Count : ${unknownList.length}");
    //await getRecentFiles();
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

  categorizeFile(BlazeFileEntity file) async {
    var type = file.category;

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

  getRecentFiles() async {
    setLoading(ViewState.Loading);
    recentFiles = allFiles.sublist(allFiles.length - 20, allFiles.length);
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
    await dir.list(recursive: true).forEach((f) {
      var blazeFileEntity = FileUtils.getBlazeEntity(f);

      if (blazeFileEntity.fileEntityType == FileEntityType.Folder) {
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

}

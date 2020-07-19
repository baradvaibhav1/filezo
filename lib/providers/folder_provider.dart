import 'dart:async';
import 'dart:io';

import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/models/path_box.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:flutter/foundation.dart';

class FolderProvider extends ChangeNotifier {
  BaseProvider _baseProvider;
  String currentPath;
  StorageBoxData currentBox;
  List<BlazeFileEntity> currentBlazeList = [];
  List<BlazeFileEntity> currentFolderList = [];
  List<BlazeFileEntity> currentFileList = [];
  List<PathBox> pathBoxList = [];
  ViewState viewState = ViewState.Free;

  FolderProvider();

  rebase(BaseProvider baseProvider) {
    rebaseInit(baseProvider);
  }

  rebaseInit(BaseProvider baseProvider) async {
    print("Rebase Called");
    setLoading();

    this._baseProvider = baseProvider;

    if (currentPath != null) {
      var box = _baseProvider.getStorageBoxFromPath(currentPath);
      if (box == null) {
        //If the StorageBox is No longer Online when Base Updates, we reassign.
        currentBox = _baseProvider.getPrimaryStorage();
        currentPath = currentBox.path;

        await _loadBlazeEntitiesInPath();
      }
    } else {
      //first setup
      //await _initSetup();
    }
    cancelLoadingNoNotif();
    // notifyListeners();
  }

  updateFolderData(String path, {bool addPath = true}) async {
    print("Update Called");

    if (currentPath != path) {
      setLoading();

      if (_baseProvider.isFree()) {
        currentBox = _baseProvider.getStorageBoxFromPath(path);
        currentPath = path;
        print("Update $path");

        if (addPath) insertPathBox(path);

        await _loadBlazeEntitiesInPath();
        //TODO Load Files
      }

      cancelLoadingNoNotif();
      notifyListeners();
    }
  }

  _initSetup() async {
    if (_baseProvider.isFree()) {
      currentBox = _baseProvider.getPrimaryStorage();
      currentPath = currentBox.path;

      await _loadBlazeEntitiesInPath();
      //TODO Load Files
    }
  }

  _loadBlazeEntitiesInPath() async {
    setLoading();

    currentBlazeList.clear();
    currentFolderList.clear();
    currentFileList.clear();

    await dirContents(Directory(currentPath));

    await sort();

    print(currentFolderList.length);
    print(currentFileList.length);
    // await currentBlazeList.addAll(list);

    print("Loading done");

    notifyListeners();
  }

  setLoading() {
    viewState = ViewState.Loading;
    notifyListeners();
  }

  cancelLoading() {
    viewState = ViewState.Free;
    notifyListeners();
  }

  setLoadingNoNotif() {
    viewState = ViewState.Loading;
  }

  cancelLoadingNoNotif() {
    viewState = ViewState.Free;
  }

  isFree() {
    return viewState == ViewState.Free ? true : false;
  }

  Future sort() async {
    await currentFolderList.sort(
        (a, b) => a.basename.toLowerCase().compareTo(b.basename.toLowerCase()));
    await currentFileList.sort(
        (a, b) => a.basename.toLowerCase().compareTo(b.basename.toLowerCase()));

    await currentBlazeList.clear();

    await currentBlazeList.addAll(currentFolderList);
    await currentBlazeList.addAll(currentFileList);

    print("Sorting done");

    notifyListeners();

    return;
  }

  Future<List<FileSystemEntity>> dirContents(Directory dir) async {
    List<FileSystemEntity> contents = dir.listSync().toList();
    for (var fileOrDir in contents) {
      if (FileUtils.isLegitHidden(fileOrDir)) continue;

      if (fileOrDir is File) {
        currentFileList.add(FileUtils.getBlazeEntitySync(fileOrDir));
        print(fileOrDir.path);
      } else if (fileOrDir is Directory) {
        currentFolderList.add(FileUtils.getBlazeEntitySync(fileOrDir));
        print(fileOrDir.path);
      }
    }
  }

  insertPathBox(String path) {
    if (path == currentBox.path)
      pathBoxList.add(PathBox(path, currentBox.boxName));
    else
      pathBoxList.add(FileUtils.getPathBox(path));
  }

  resetPathBox() {
    pathBoxList.clear();
    notifyListeners();
  }

  handlePop() {
    if (pathBoxList.length <= 1)
      return true;
    else {
      pathBoxList.removeLast();
      updateFolderData(pathBoxList.last.path, addPath: false);
    }
  }
}

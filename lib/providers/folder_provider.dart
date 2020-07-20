import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:fileexplorer/enums/select_type.dart';
import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/models/path_box.dart';
import 'package:fileexplorer/models/path_key.dart';
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
  List<BlazeFileEntity> selectedList = [];
  List<PathBox> pathBoxList = [];
  ViewState viewState = ViewState.Free;
  SelectType selectState = SelectType.UnAvailable;
  List<PathKey> pathKeyList = [];

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

      cancelLoading();
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

    cancelLoading();
  }

  setLoading() {
    if (viewState != ViewState.Loading) {
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  cancelLoading() {
    if (viewState != ViewState.Free) {
      viewState = ViewState.Free;
      notifyListeners();
    }
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
    if (selectState != SelectType.UnAvailable) {
      resetSelection();
      return false;
    }

    if (pathBoxList.length <= 1) {
      pathBoxList.clear();
      pathKeyList.clear();
      return true;
    } else {
      removeKey(pathBoxList.last.path);
      pathBoxList.removeLast();
      updateFolderData(pathBoxList.last.path, addPath: false);
    }
  }

  goToPath(String path) {
    var index = pathBoxList.indexWhere((element) => element.path == path);

    if (index != -1) {
      pathBoxList.removeRange(index + 1, pathBoxList.length);
      updateFolderData(path, addPath: false);
    }
  }

  firstSelect(int index) {
    if (selectState == SelectType.UnAvailable) {
      activateSelection();
      select(index);
      notifyListeners();
    }
  }

  activateSelection({bool notify = false}) {
    selectState = SelectType.Available;
    setSelectList();
    if (notify) notifyListeners();
  }

  select(int index, {bool notify = false}) {
    var entity =
        currentBlazeList[index].copyWith(selectType: SelectType.Selected);
    currentBlazeList[index] = entity;
    selectedList.add(entity);

    if (notify) notifyListeners();
  }

  deselect(int index, {bool notify = false}) {
    selectedList.remove(currentBlazeList[index]);
    var entity =
        currentBlazeList[index].copyWith(selectType: SelectType.Available);
    currentBlazeList[index] = entity;

    if (notify) notifyListeners();
  }

  resetSelection() {
    if (selectState != SelectType.UnAvailable) {
      selectState = SelectType.UnAvailable;
      removeSelectList();
      selectedList.clear();
      notifyListeners();
    }
  }

  setSelectList() {
    currentBlazeList = currentBlazeList
        .map((e) => e.copyWith(selectType: SelectType.Available))
        .toList();
  }

  removeSelectList() {
    currentBlazeList = currentBlazeList
        .map((e) => e.copyWith(selectType: SelectType.UnAvailable))
        .toList();
  }

  onTap(int index) {
    var blazeFile = currentBlazeList[index];

    if (selectState == SelectType.UnAvailable)
      updateFolderData(blazeFile.path);
    else {
      if (blazeFile.selectType == SelectType.Available)
        select(index, notify: true);
      else
        deselect(index, notify: true);
    }
  }

  onLongPress(int index) {
    var blazeFile = currentBlazeList[index];

    if (selectState == SelectType.UnAvailable) firstSelect(index);
  }

  PathKey getPathKey(String path) {
    var key =
        pathKeyList.firstWhere((element) => element.path == path, orElse: () {
      var newKey = PathKey(
          path,
          ValueKey<int>(Random(DateTime.now().millisecondsSinceEpoch)
              .nextInt(4294967296)));
      pathKeyList.add(newKey);
      return newKey;
    });

    return key;
  }

  removeKey(String path) {
    pathKeyList.removeWhere((element) => element.path == path);
  }
}

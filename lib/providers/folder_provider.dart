import 'dart:io';

import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/cupertino.dart';

class FolderProvider extends ChangeNotifier {
  BaseProvider _baseProvider;
  String currentPath;
  StorageBoxData currentBox;
  List<BlazeFileEntity> currentBlazeList = [];
  List<BlazeFileEntity> currentFolderList = [];
  List<BlazeFileEntity> currentFileList = [];
  ViewState viewState = ViewState.Free;

  FolderProvider();

  rebase(BaseProvider baseProvider){
    rebaseInit(baseProvider);
  }

  rebaseInit(BaseProvider baseProvider) async{
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
      await _initSetup();
    }
    cancelLoadingNoNotif();
    notifyListeners();
  }

  updateFolderData(String path) async {
    print("Update Called");

    if (currentPath != path) {
      setLoading();

      if (_baseProvider.isFree()) {
        currentBox = _baseProvider.getStorageBoxFromPath(path);
        currentPath = path;

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

    currentBlazeList =
        await FileUtils.getBlazeInPath(dir: Directory(currentPath));
    print(currentBlazeList.length);
    // await currentBlazeList.addAll(list);

    await sort();

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

  sort() async{
    await currentBlazeList.forEach((element) {
      if (element.fileEntityType == FileEntityType.Folder)
        currentFolderList.add(element);
      else
        currentFileList.add(element);
    });

    await currentFolderList.sort((a, b) => a.name.compareTo(b.name));
    await currentFileList.sort((a, b) => a.name.compareTo(b.name));

    await currentBlazeList.clear();

    await currentBlazeList.addAll(currentFolderList);
    await currentBlazeList.addAll(currentFileList);

    notifyListeners();
  }
}

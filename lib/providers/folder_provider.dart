import 'package:fileexplorer/enums/view_states.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/cupertino.dart';

class FolderProvider extends ChangeNotifier {
  BaseProvider _baseProvider;
  String currentPath;
  StorageBoxData currentBox;
  List<BlazeFileEntity> currentBlazeList = [];
  ViewState viewState = ViewState.Free;

  FolderProvider();

  rebaseInit(BaseProvider baseProvider) {
    print("Rebase Called");
    setLoading();

    this._baseProvider = baseProvider;

    if (currentPath != null) {
      //If the StorageBox is No longer Online when Base Updates, we reassign.
      var box = _baseProvider.getStorageBoxFromPath(currentPath);
      if (box == null) {
        _baseProvider.getPrimaryStorage();
      }
    } else {
      //first setup
      _initSetup();
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

  _loadBlazeEntitiesInPath() async {}

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
}

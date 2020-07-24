import 'package:fileexplorer/enums/boxtypes.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/theme/app_colors.dart';

class StorageBoxes {
  static const StorageBoxData GoogleDrive = StorageBoxData(
    boxType: BoxType.GoogleDrive,
    boxName: "Google Drive",
    color: AppColors.googleDrive,
    imgPath: "assets/images/gdrive.png",
  );

  static const StorageBoxData InternalStorage = StorageBoxData(
    boxType: BoxType.InternalStorage,
    boxName: "Internal Storage",
    color: AppColors.internalStorage,
    imgPath: "assets/images/internal_storage.png",
  );

  static const StorageBoxData ExternalStorage = StorageBoxData(
    boxType: BoxType.ExternalStorage,
    boxName: "External Storage",
    color: AppColors.externalStorage,
    imgPath: "assets/images/external_storage.png",
  );

  static const StorageBoxData OneDrive = StorageBoxData(
    boxType: BoxType.OneDrive,
    boxName: "OneDrive",
    color: AppColors.oneDrive,
    imgPath: "assets/images/onedrive.png",
  );

  static const StorageBoxData RootBrowser = StorageBoxData(
    boxType: BoxType.RootBrowser,
    boxName: "Root Browser",
    color: AppColors.oneDrive,
    imgPath: "assets/images/onedrive.png",
  );


  static StorageBoxData getData(BoxType boxType)
  {
    switch(boxType)
    {
      case BoxType.InternalStorage:
        return InternalStorage;
      case BoxType.ExternalStorage:
        return ExternalStorage;
      case BoxType.GoogleDrive:
        return GoogleDrive;
      case BoxType.OneDrive:
        return OneDrive;
      case BoxType.RootBrowser:
        return RootBrowser;
      default:
        return InternalStorage;
    }
  }
}

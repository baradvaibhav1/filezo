import 'package:fileexplorer/data/storage_boxes.dart';
import 'package:fileexplorer/enums/boxtypes.dart';
import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:fileexplorer/widgets/storage_box.dart';

/// freeSpace : 6239432704
/// totalSpace : 53214502912
/// type : "InternalStorage"
/// volumeName : "Internal shared storage"
/// volumePath : "/storage/emulated/0"

class VolumeInfo {
  int _freeSpace;
  int _totalSpace;
  String _type;
  String _volumeName;
  String _volumePath;

  int get freeSpace => _freeSpace;

  int get totalSpace => _totalSpace;

  String get type => _type;

  String get volumeName => _volumeName;

  String get volumePath => _volumePath;

  VolumeInfo(
      {int freeSpace,
      int totalSpace,
      String type,
      String volumeName,
      String volumePath}) {
    _freeSpace = freeSpace;
    _totalSpace = totalSpace;
    _type = type;
    _volumeName = volumeName;
    _volumePath = volumePath;
  }

  VolumeInfo.fromJson(dynamic json) {
    _freeSpace = json["freeSpace"];
    _totalSpace = json["totalSpace"];
    _type = json["type"];
    _volumeName = json["volumeName"];
    _volumePath = json["volumePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["freeSpace"] = _freeSpace;
    map["totalSpace"] = _totalSpace;
    map["type"] = _type;
    map["volumeName"] = _volumeName;
    map["volumePath"] = _volumePath;
    return map;
  }

  static StorageBoxData getStorageBox(VolumeInfo volumeInfo) {
    StorageBoxData baseBox = StorageBoxes.InternalStorage;

    switch (volumeInfo.type) {
      case "InternalStorage":
        baseBox = StorageBoxes.InternalStorage;
        break;
      case "ExternalStorage":
        baseBox = StorageBoxes.ExternalStorage;
        break;
      case "USBDrive":
        baseBox = StorageBoxes.ExternalStorage;
        break;
    }

    int usedSpaceInt = volumeInfo.totalSpace - volumeInfo.freeSpace;

    String totalSpace = FileUtils.formatBytes(volumeInfo.totalSpace, 2);
    String freeSpace = FileUtils.formatBytes(volumeInfo.freeSpace, 2);
    String usedSpace = FileUtils.formatBytes(usedSpaceInt, 2);

    double percentFull =
        volumeInfo.totalSpace != 0 ? usedSpaceInt / volumeInfo.totalSpace : 0;

    String path = volumeInfo.volumePath;
    String name = volumeInfo.volumeName;

    baseBox = baseBox.copyWith(
      boxName:
          baseBox.boxType == BoxType.InternalStorage ? "Device Storage" : name,
      path: path,
      percentFull: percentFull,
      totalLabel: totalSpace,
      freeLabel: freeSpace,
      usedLabel: usedSpace,
    );

    return baseBox;
  }
}


import 'package:fileexplorer/enums/boxtypes.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'storage_box_data.freezed.dart';

@freezed
abstract class StorageBoxData with _$StorageBoxData {
  const factory StorageBoxData({BoxType boxType, String boxName, String path, @Default(0.5) double percentFull, @Default("∞") String freeLabel, @Default("∞") String usedLabel, @Default("∞") String totalLabel, Color color, String imgPath}) = _StorageBoxData;
}

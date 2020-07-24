import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/enums/select_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'blaze_entity_lite.freezed.dart';
part 'blaze_entity_lite.g.dart';

@freezed
abstract class BlazeEntityLite with _$BlazeEntityLite {
  const factory BlazeEntityLite({
    String fileEntityType,
    int filesCount,
    String group,
    bool isSymlink,
    String owner,
    String path,
    String permissions,
    int rTriplet,
    int sTriplet,
    int size,
    String symlinkPath,
    int timeStamp,
    int wTriplet,
    int xTriplet,
  }) = _BlazeEntityLite;


  factory BlazeEntityLite.fromJson(Map<String, dynamic> json) => _$BlazeEntityLiteFromJson(json);
}


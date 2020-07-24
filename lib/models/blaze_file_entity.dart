import 'dart:io';

import 'package:fileexplorer/enums/categories.dart';
import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/enums/select_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'blaze_file_entity.freezed.dart';
part 'blaze_file_entity.g.dart';

@freezed
abstract class BlazeFileEntity with _$BlazeFileEntity {
  const factory BlazeFileEntity({
    FileEntityType fileEntityType,
    String path,
    String basename,
    String extension,
    String name,
    String mime,
    String size,
    String timestamp,
    FileCategory category,
    int filesInsideCount,
    @Default(SelectType.UnAvailable) SelectType selectType,
    @Default(false) bool isRoot,
    @Default(0) int sTriplet,
    @Default(0) int rTriplet,
    @Default(0) int wTriplet,
    @Default(0) int xTriplet,
    String permissions,
    String owner,
    String group,
    @Default(false) bool isSymlink,
    String symlinkPath,
  }) = _BlazeFileEntity;


  factory BlazeFileEntity.fromJson(Map<String, dynamic> json) => _$BlazeFileEntityFromJson(json);
}

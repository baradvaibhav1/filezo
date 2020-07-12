import 'dart:io';

import 'package:fileexplorer/enums/categories.dart';
import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'blaze_file_entity.freezed.dart';

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
    int timestamp,
    FileCategory category,
    int filesInsideCount,
    File file,
  }) = _BlazeFileEntity;
}

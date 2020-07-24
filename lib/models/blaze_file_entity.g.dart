// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blaze_file_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlazeFileEntity _$_$_BlazeFileEntityFromJson(Map<String, dynamic> json) {
  return _$_BlazeFileEntity(
    fileEntityType:
        _$enumDecodeNullable(_$FileEntityTypeEnumMap, json['fileEntityType']),
    path: json['path'] as String,
    basename: json['basename'] as String,
    extension: json['extension'] as String,
    name: json['name'] as String,
    mime: json['mime'] as String,
    size: json['size'] as String,
    timestamp: json['timestamp'] as String,
    category: _$enumDecodeNullable(_$FileCategoryEnumMap, json['category']),
    filesInsideCount: json['filesInsideCount'] as int,
    selectType: _$enumDecodeNullable(_$SelectTypeEnumMap, json['selectType']) ??
        SelectType.UnAvailable,
    isRoot: json['isRoot'] as bool ?? false,
    sTriplet: json['sTriplet'] as int ?? 0,
    rTriplet: json['rTriplet'] as int ?? 0,
    wTriplet: json['wTriplet'] as int ?? 0,
    xTriplet: json['xTriplet'] as int ?? 0,
    permissions: json['permissions'] as String,
    owner: json['owner'] as String,
    group: json['group'] as String,
    isSymlink: json['isSymlink'] as bool ?? false,
    symlinkPath: json['symlinkPath'] as String,
  );
}

Map<String, dynamic> _$_$_BlazeFileEntityToJson(_$_BlazeFileEntity instance) =>
    <String, dynamic>{
      'fileEntityType': _$FileEntityTypeEnumMap[instance.fileEntityType],
      'path': instance.path,
      'basename': instance.basename,
      'extension': instance.extension,
      'name': instance.name,
      'mime': instance.mime,
      'size': instance.size,
      'timestamp': instance.timestamp,
      'category': _$FileCategoryEnumMap[instance.category],
      'filesInsideCount': instance.filesInsideCount,
      'selectType': _$SelectTypeEnumMap[instance.selectType],
      'isRoot': instance.isRoot,
      'sTriplet': instance.sTriplet,
      'rTriplet': instance.rTriplet,
      'wTriplet': instance.wTriplet,
      'xTriplet': instance.xTriplet,
      'permissions': instance.permissions,
      'owner': instance.owner,
      'group': instance.group,
      'isSymlink': instance.isSymlink,
      'symlinkPath': instance.symlinkPath,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$FileEntityTypeEnumMap = {
  FileEntityType.File: 'File',
  FileEntityType.Folder: 'Folder',
  FileEntityType.Link: 'Link',
};

const _$FileCategoryEnumMap = {
  FileCategory.Image: 'Image',
  FileCategory.Doc: 'Doc',
  FileCategory.Audio: 'Audio',
  FileCategory.APK: 'APK',
  FileCategory.Archive: 'Archive',
  FileCategory.Video: 'Video',
  FileCategory.Unknown: 'Unknown',
};

const _$SelectTypeEnumMap = {
  SelectType.Available: 'Available',
  SelectType.Selected: 'Selected',
  SelectType.UnAvailable: 'UnAvailable',
};

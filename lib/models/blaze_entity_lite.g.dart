// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blaze_entity_lite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlazeEntityLite _$_$_BlazeEntityLiteFromJson(Map<String, dynamic> json) {
  return _$_BlazeEntityLite(
    fileEntityType: json['fileEntityType'] as String,
    filesCount: json['filesCount'] as int,
    group: json['group'] as String,
    isSymlink: json['isSymlink'] as bool,
    owner: json['owner'] as String,
    path: json['path'] as String,
    permissions: json['permissions'] as String,
    rTriplet: json['rTriplet'] as int,
    sTriplet: json['sTriplet'] as int,
    size: json['size'] as int,
    symlinkPath: json['symlinkPath'] as String,
    timeStamp: json['timeStamp'] as int,
    wTriplet: json['wTriplet'] as int,
    xTriplet: json['xTriplet'] as int,
  );
}

Map<String, dynamic> _$_$_BlazeEntityLiteToJson(_$_BlazeEntityLite instance) =>
    <String, dynamic>{
      'fileEntityType': instance.fileEntityType,
      'filesCount': instance.filesCount,
      'group': instance.group,
      'isSymlink': instance.isSymlink,
      'owner': instance.owner,
      'path': instance.path,
      'permissions': instance.permissions,
      'rTriplet': instance.rTriplet,
      'sTriplet': instance.sTriplet,
      'size': instance.size,
      'symlinkPath': instance.symlinkPath,
      'timeStamp': instance.timeStamp,
      'wTriplet': instance.wTriplet,
      'xTriplet': instance.xTriplet,
    };

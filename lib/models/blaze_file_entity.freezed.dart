// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'blaze_file_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BlazeFileEntityTearOff {
  const _$BlazeFileEntityTearOff();

  _BlazeFileEntity call(
      {FileEntityType fileEntityType,
      String path,
      String basename,
      String extension,
      String name,
      String mime,
      String size,
      String timestamp,
      FileCategory category,
      int filesInsideCount,
      File file}) {
    return _BlazeFileEntity(
      fileEntityType: fileEntityType,
      path: path,
      basename: basename,
      extension: extension,
      name: name,
      mime: mime,
      size: size,
      timestamp: timestamp,
      category: category,
      filesInsideCount: filesInsideCount,
      file: file,
    );
  }
}

// ignore: unused_element
const $BlazeFileEntity = _$BlazeFileEntityTearOff();

mixin _$BlazeFileEntity {
  FileEntityType get fileEntityType;
  String get path;
  String get basename;
  String get extension;
  String get name;
  String get mime;
  String get size;
  String get timestamp;
  FileCategory get category;
  int get filesInsideCount;
  File get file;

  $BlazeFileEntityCopyWith<BlazeFileEntity> get copyWith;
}

abstract class $BlazeFileEntityCopyWith<$Res> {
  factory $BlazeFileEntityCopyWith(
          BlazeFileEntity value, $Res Function(BlazeFileEntity) then) =
      _$BlazeFileEntityCopyWithImpl<$Res>;
  $Res call(
      {FileEntityType fileEntityType,
      String path,
      String basename,
      String extension,
      String name,
      String mime,
      String size,
      String timestamp,
      FileCategory category,
      int filesInsideCount,
      File file});
}

class _$BlazeFileEntityCopyWithImpl<$Res>
    implements $BlazeFileEntityCopyWith<$Res> {
  _$BlazeFileEntityCopyWithImpl(this._value, this._then);

  final BlazeFileEntity _value;
  // ignore: unused_field
  final $Res Function(BlazeFileEntity) _then;

  @override
  $Res call({
    Object fileEntityType = freezed,
    Object path = freezed,
    Object basename = freezed,
    Object extension = freezed,
    Object name = freezed,
    Object mime = freezed,
    Object size = freezed,
    Object timestamp = freezed,
    Object category = freezed,
    Object filesInsideCount = freezed,
    Object file = freezed,
  }) {
    return _then(_value.copyWith(
      fileEntityType: fileEntityType == freezed
          ? _value.fileEntityType
          : fileEntityType as FileEntityType,
      path: path == freezed ? _value.path : path as String,
      basename: basename == freezed ? _value.basename : basename as String,
      extension: extension == freezed ? _value.extension : extension as String,
      name: name == freezed ? _value.name : name as String,
      mime: mime == freezed ? _value.mime : mime as String,
      size: size == freezed ? _value.size : size as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as String,
      category:
          category == freezed ? _value.category : category as FileCategory,
      filesInsideCount: filesInsideCount == freezed
          ? _value.filesInsideCount
          : filesInsideCount as int,
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

abstract class _$BlazeFileEntityCopyWith<$Res>
    implements $BlazeFileEntityCopyWith<$Res> {
  factory _$BlazeFileEntityCopyWith(
          _BlazeFileEntity value, $Res Function(_BlazeFileEntity) then) =
      __$BlazeFileEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {FileEntityType fileEntityType,
      String path,
      String basename,
      String extension,
      String name,
      String mime,
      String size,
      String timestamp,
      FileCategory category,
      int filesInsideCount,
      File file});
}

class __$BlazeFileEntityCopyWithImpl<$Res>
    extends _$BlazeFileEntityCopyWithImpl<$Res>
    implements _$BlazeFileEntityCopyWith<$Res> {
  __$BlazeFileEntityCopyWithImpl(
      _BlazeFileEntity _value, $Res Function(_BlazeFileEntity) _then)
      : super(_value, (v) => _then(v as _BlazeFileEntity));

  @override
  _BlazeFileEntity get _value => super._value as _BlazeFileEntity;

  @override
  $Res call({
    Object fileEntityType = freezed,
    Object path = freezed,
    Object basename = freezed,
    Object extension = freezed,
    Object name = freezed,
    Object mime = freezed,
    Object size = freezed,
    Object timestamp = freezed,
    Object category = freezed,
    Object filesInsideCount = freezed,
    Object file = freezed,
  }) {
    return _then(_BlazeFileEntity(
      fileEntityType: fileEntityType == freezed
          ? _value.fileEntityType
          : fileEntityType as FileEntityType,
      path: path == freezed ? _value.path : path as String,
      basename: basename == freezed ? _value.basename : basename as String,
      extension: extension == freezed ? _value.extension : extension as String,
      name: name == freezed ? _value.name : name as String,
      mime: mime == freezed ? _value.mime : mime as String,
      size: size == freezed ? _value.size : size as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as String,
      category:
          category == freezed ? _value.category : category as FileCategory,
      filesInsideCount: filesInsideCount == freezed
          ? _value.filesInsideCount
          : filesInsideCount as int,
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

class _$_BlazeFileEntity
    with DiagnosticableTreeMixin
    implements _BlazeFileEntity {
  const _$_BlazeFileEntity(
      {this.fileEntityType,
      this.path,
      this.basename,
      this.extension,
      this.name,
      this.mime,
      this.size,
      this.timestamp,
      this.category,
      this.filesInsideCount,
      this.file});

  @override
  final FileEntityType fileEntityType;
  @override
  final String path;
  @override
  final String basename;
  @override
  final String extension;
  @override
  final String name;
  @override
  final String mime;
  @override
  final String size;
  @override
  final String timestamp;
  @override
  final FileCategory category;
  @override
  final int filesInsideCount;
  @override
  final File file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BlazeFileEntity(fileEntityType: $fileEntityType, path: $path, basename: $basename, extension: $extension, name: $name, mime: $mime, size: $size, timestamp: $timestamp, category: $category, filesInsideCount: $filesInsideCount, file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BlazeFileEntity'))
      ..add(DiagnosticsProperty('fileEntityType', fileEntityType))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('basename', basename))
      ..add(DiagnosticsProperty('extension', extension))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('mime', mime))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('filesInsideCount', filesInsideCount))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlazeFileEntity &&
            (identical(other.fileEntityType, fileEntityType) ||
                const DeepCollectionEquality()
                    .equals(other.fileEntityType, fileEntityType)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.basename, basename) ||
                const DeepCollectionEquality()
                    .equals(other.basename, basename)) &&
            (identical(other.extension, extension) ||
                const DeepCollectionEquality()
                    .equals(other.extension, extension)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.filesInsideCount, filesInsideCount) ||
                const DeepCollectionEquality()
                    .equals(other.filesInsideCount, filesInsideCount)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileEntityType) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(basename) ^
      const DeepCollectionEquality().hash(extension) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(filesInsideCount) ^
      const DeepCollectionEquality().hash(file);

  @override
  _$BlazeFileEntityCopyWith<_BlazeFileEntity> get copyWith =>
      __$BlazeFileEntityCopyWithImpl<_BlazeFileEntity>(this, _$identity);
}

abstract class _BlazeFileEntity implements BlazeFileEntity {
  const factory _BlazeFileEntity(
      {FileEntityType fileEntityType,
      String path,
      String basename,
      String extension,
      String name,
      String mime,
      String size,
      String timestamp,
      FileCategory category,
      int filesInsideCount,
      File file}) = _$_BlazeFileEntity;

  @override
  FileEntityType get fileEntityType;
  @override
  String get path;
  @override
  String get basename;
  @override
  String get extension;
  @override
  String get name;
  @override
  String get mime;
  @override
  String get size;
  @override
  String get timestamp;
  @override
  FileCategory get category;
  @override
  int get filesInsideCount;
  @override
  File get file;
  @override
  _$BlazeFileEntityCopyWith<_BlazeFileEntity> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'storage_box_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StorageBoxDataTearOff {
  const _$StorageBoxDataTearOff();

  _StorageBoxData call(
      {BoxType boxType,
      String boxName,
      String path,
      double percentFull = 0.5,
      String freeLabel = '∞',
      String usedLabel = '∞',
      String totalLabel = '∞',
      Color color,
      String imgPath}) {
    return _StorageBoxData(
      boxType: boxType,
      boxName: boxName,
      path: path,
      percentFull: percentFull,
      freeLabel: freeLabel,
      usedLabel: usedLabel,
      totalLabel: totalLabel,
      color: color,
      imgPath: imgPath,
    );
  }
}

// ignore: unused_element
const $StorageBoxData = _$StorageBoxDataTearOff();

mixin _$StorageBoxData {
  BoxType get boxType;
  String get boxName;
  String get path;
  double get percentFull;
  String get freeLabel;
  String get usedLabel;
  String get totalLabel;
  Color get color;
  String get imgPath;

  $StorageBoxDataCopyWith<StorageBoxData> get copyWith;
}

abstract class $StorageBoxDataCopyWith<$Res> {
  factory $StorageBoxDataCopyWith(
          StorageBoxData value, $Res Function(StorageBoxData) then) =
      _$StorageBoxDataCopyWithImpl<$Res>;
  $Res call(
      {BoxType boxType,
      String boxName,
      String path,
      double percentFull,
      String freeLabel,
      String usedLabel,
      String totalLabel,
      Color color,
      String imgPath});
}

class _$StorageBoxDataCopyWithImpl<$Res>
    implements $StorageBoxDataCopyWith<$Res> {
  _$StorageBoxDataCopyWithImpl(this._value, this._then);

  final StorageBoxData _value;
  // ignore: unused_field
  final $Res Function(StorageBoxData) _then;

  @override
  $Res call({
    Object boxType = freezed,
    Object boxName = freezed,
    Object path = freezed,
    Object percentFull = freezed,
    Object freeLabel = freezed,
    Object usedLabel = freezed,
    Object totalLabel = freezed,
    Object color = freezed,
    Object imgPath = freezed,
  }) {
    return _then(_value.copyWith(
      boxType: boxType == freezed ? _value.boxType : boxType as BoxType,
      boxName: boxName == freezed ? _value.boxName : boxName as String,
      path: path == freezed ? _value.path : path as String,
      percentFull:
          percentFull == freezed ? _value.percentFull : percentFull as double,
      freeLabel: freeLabel == freezed ? _value.freeLabel : freeLabel as String,
      usedLabel: usedLabel == freezed ? _value.usedLabel : usedLabel as String,
      totalLabel:
          totalLabel == freezed ? _value.totalLabel : totalLabel as String,
      color: color == freezed ? _value.color : color as Color,
      imgPath: imgPath == freezed ? _value.imgPath : imgPath as String,
    ));
  }
}

abstract class _$StorageBoxDataCopyWith<$Res>
    implements $StorageBoxDataCopyWith<$Res> {
  factory _$StorageBoxDataCopyWith(
          _StorageBoxData value, $Res Function(_StorageBoxData) then) =
      __$StorageBoxDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {BoxType boxType,
      String boxName,
      String path,
      double percentFull,
      String freeLabel,
      String usedLabel,
      String totalLabel,
      Color color,
      String imgPath});
}

class __$StorageBoxDataCopyWithImpl<$Res>
    extends _$StorageBoxDataCopyWithImpl<$Res>
    implements _$StorageBoxDataCopyWith<$Res> {
  __$StorageBoxDataCopyWithImpl(
      _StorageBoxData _value, $Res Function(_StorageBoxData) _then)
      : super(_value, (v) => _then(v as _StorageBoxData));

  @override
  _StorageBoxData get _value => super._value as _StorageBoxData;

  @override
  $Res call({
    Object boxType = freezed,
    Object boxName = freezed,
    Object path = freezed,
    Object percentFull = freezed,
    Object freeLabel = freezed,
    Object usedLabel = freezed,
    Object totalLabel = freezed,
    Object color = freezed,
    Object imgPath = freezed,
  }) {
    return _then(_StorageBoxData(
      boxType: boxType == freezed ? _value.boxType : boxType as BoxType,
      boxName: boxName == freezed ? _value.boxName : boxName as String,
      path: path == freezed ? _value.path : path as String,
      percentFull:
          percentFull == freezed ? _value.percentFull : percentFull as double,
      freeLabel: freeLabel == freezed ? _value.freeLabel : freeLabel as String,
      usedLabel: usedLabel == freezed ? _value.usedLabel : usedLabel as String,
      totalLabel:
          totalLabel == freezed ? _value.totalLabel : totalLabel as String,
      color: color == freezed ? _value.color : color as Color,
      imgPath: imgPath == freezed ? _value.imgPath : imgPath as String,
    ));
  }
}

class _$_StorageBoxData
    with DiagnosticableTreeMixin
    implements _StorageBoxData {
  const _$_StorageBoxData(
      {this.boxType,
      this.boxName,
      this.path,
      this.percentFull = 0.5,
      this.freeLabel = '∞',
      this.usedLabel = '∞',
      this.totalLabel = '∞',
      this.color,
      this.imgPath})
      : assert(percentFull != null),
        assert(freeLabel != null),
        assert(usedLabel != null),
        assert(totalLabel != null);

  @override
  final BoxType boxType;
  @override
  final String boxName;
  @override
  final String path;
  @JsonKey(defaultValue: 0.5)
  @override
  final double percentFull;
  @JsonKey(defaultValue: '∞')
  @override
  final String freeLabel;
  @JsonKey(defaultValue: '∞')
  @override
  final String usedLabel;
  @JsonKey(defaultValue: '∞')
  @override
  final String totalLabel;
  @override
  final Color color;
  @override
  final String imgPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StorageBoxData(boxType: $boxType, boxName: $boxName, path: $path, percentFull: $percentFull, freeLabel: $freeLabel, usedLabel: $usedLabel, totalLabel: $totalLabel, color: $color, imgPath: $imgPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StorageBoxData'))
      ..add(DiagnosticsProperty('boxType', boxType))
      ..add(DiagnosticsProperty('boxName', boxName))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('percentFull', percentFull))
      ..add(DiagnosticsProperty('freeLabel', freeLabel))
      ..add(DiagnosticsProperty('usedLabel', usedLabel))
      ..add(DiagnosticsProperty('totalLabel', totalLabel))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('imgPath', imgPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorageBoxData &&
            (identical(other.boxType, boxType) ||
                const DeepCollectionEquality()
                    .equals(other.boxType, boxType)) &&
            (identical(other.boxName, boxName) ||
                const DeepCollectionEquality()
                    .equals(other.boxName, boxName)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.percentFull, percentFull) ||
                const DeepCollectionEquality()
                    .equals(other.percentFull, percentFull)) &&
            (identical(other.freeLabel, freeLabel) ||
                const DeepCollectionEquality()
                    .equals(other.freeLabel, freeLabel)) &&
            (identical(other.usedLabel, usedLabel) ||
                const DeepCollectionEquality()
                    .equals(other.usedLabel, usedLabel)) &&
            (identical(other.totalLabel, totalLabel) ||
                const DeepCollectionEquality()
                    .equals(other.totalLabel, totalLabel)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.imgPath, imgPath) ||
                const DeepCollectionEquality().equals(other.imgPath, imgPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boxType) ^
      const DeepCollectionEquality().hash(boxName) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(percentFull) ^
      const DeepCollectionEquality().hash(freeLabel) ^
      const DeepCollectionEquality().hash(usedLabel) ^
      const DeepCollectionEquality().hash(totalLabel) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(imgPath);

  @override
  _$StorageBoxDataCopyWith<_StorageBoxData> get copyWith =>
      __$StorageBoxDataCopyWithImpl<_StorageBoxData>(this, _$identity);
}

abstract class _StorageBoxData implements StorageBoxData {
  const factory _StorageBoxData(
      {BoxType boxType,
      String boxName,
      String path,
      double percentFull,
      String freeLabel,
      String usedLabel,
      String totalLabel,
      Color color,
      String imgPath}) = _$_StorageBoxData;

  @override
  BoxType get boxType;
  @override
  String get boxName;
  @override
  String get path;
  @override
  double get percentFull;
  @override
  String get freeLabel;
  @override
  String get usedLabel;
  @override
  String get totalLabel;
  @override
  Color get color;
  @override
  String get imgPath;
  @override
  _$StorageBoxDataCopyWith<_StorageBoxData> get copyWith;
}

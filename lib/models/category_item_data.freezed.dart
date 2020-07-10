// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'category_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CategoryItemDataTearOff {
  const _$CategoryItemDataTearOff();

  _CategoryItemData call(
      {Categories category,
      String text,
      String imgPath,
      void Function() callback,
      Color color}) {
    return _CategoryItemData(
      category: category,
      text: text,
      imgPath: imgPath,
      callback: callback,
      color: color,
    );
  }
}

// ignore: unused_element
const $CategoryItemData = _$CategoryItemDataTearOff();

mixin _$CategoryItemData {
  Categories get category;
  String get text;
  String get imgPath;
  void Function() get callback;
  Color get color;

  $CategoryItemDataCopyWith<CategoryItemData> get copyWith;
}

abstract class $CategoryItemDataCopyWith<$Res> {
  factory $CategoryItemDataCopyWith(
          CategoryItemData value, $Res Function(CategoryItemData) then) =
      _$CategoryItemDataCopyWithImpl<$Res>;
  $Res call(
      {Categories category,
      String text,
      String imgPath,
      void Function() callback,
      Color color});
}

class _$CategoryItemDataCopyWithImpl<$Res>
    implements $CategoryItemDataCopyWith<$Res> {
  _$CategoryItemDataCopyWithImpl(this._value, this._then);

  final CategoryItemData _value;
  // ignore: unused_field
  final $Res Function(CategoryItemData) _then;

  @override
  $Res call({
    Object category = freezed,
    Object text = freezed,
    Object imgPath = freezed,
    Object callback = freezed,
    Object color = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed ? _value.category : category as Categories,
      text: text == freezed ? _value.text : text as String,
      imgPath: imgPath == freezed ? _value.imgPath : imgPath as String,
      callback:
          callback == freezed ? _value.callback : callback as void Function(),
      color: color == freezed ? _value.color : color as Color,
    ));
  }
}

abstract class _$CategoryItemDataCopyWith<$Res>
    implements $CategoryItemDataCopyWith<$Res> {
  factory _$CategoryItemDataCopyWith(
          _CategoryItemData value, $Res Function(_CategoryItemData) then) =
      __$CategoryItemDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Categories category,
      String text,
      String imgPath,
      void Function() callback,
      Color color});
}

class __$CategoryItemDataCopyWithImpl<$Res>
    extends _$CategoryItemDataCopyWithImpl<$Res>
    implements _$CategoryItemDataCopyWith<$Res> {
  __$CategoryItemDataCopyWithImpl(
      _CategoryItemData _value, $Res Function(_CategoryItemData) _then)
      : super(_value, (v) => _then(v as _CategoryItemData));

  @override
  _CategoryItemData get _value => super._value as _CategoryItemData;

  @override
  $Res call({
    Object category = freezed,
    Object text = freezed,
    Object imgPath = freezed,
    Object callback = freezed,
    Object color = freezed,
  }) {
    return _then(_CategoryItemData(
      category: category == freezed ? _value.category : category as Categories,
      text: text == freezed ? _value.text : text as String,
      imgPath: imgPath == freezed ? _value.imgPath : imgPath as String,
      callback:
          callback == freezed ? _value.callback : callback as void Function(),
      color: color == freezed ? _value.color : color as Color,
    ));
  }
}

class _$_CategoryItemData
    with DiagnosticableTreeMixin
    implements _CategoryItemData {
  const _$_CategoryItemData(
      {this.category, this.text, this.imgPath, this.callback, this.color});

  @override
  final Categories category;
  @override
  final String text;
  @override
  final String imgPath;
  @override
  final void Function() callback;
  @override
  final Color color;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryItemData(category: $category, text: $text, imgPath: $imgPath, callback: $callback, color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryItemData'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('imgPath', imgPath))
      ..add(DiagnosticsProperty('callback', callback))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryItemData &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.imgPath, imgPath) ||
                const DeepCollectionEquality()
                    .equals(other.imgPath, imgPath)) &&
            (identical(other.callback, callback) ||
                const DeepCollectionEquality()
                    .equals(other.callback, callback)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(imgPath) ^
      const DeepCollectionEquality().hash(callback) ^
      const DeepCollectionEquality().hash(color);

  @override
  _$CategoryItemDataCopyWith<_CategoryItemData> get copyWith =>
      __$CategoryItemDataCopyWithImpl<_CategoryItemData>(this, _$identity);
}

abstract class _CategoryItemData implements CategoryItemData {
  const factory _CategoryItemData(
      {Categories category,
      String text,
      String imgPath,
      void Function() callback,
      Color color}) = _$_CategoryItemData;

  @override
  Categories get category;
  @override
  String get text;
  @override
  String get imgPath;
  @override
  void Function() get callback;
  @override
  Color get color;
  @override
  _$CategoryItemDataCopyWith<_CategoryItemData> get copyWith;
}

import 'package:fileexplorer/enums/categories.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'category_item_data.freezed.dart';

@freezed
abstract class CategoryItemData with _$CategoryItemData {
  const factory CategoryItemData({Categories category,String text, String imgPath, VoidCallback callback, Color color}) = _CategoryItemData;
}

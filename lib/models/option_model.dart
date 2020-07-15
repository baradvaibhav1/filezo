import 'package:flutter/material.dart';

class OptionModel {
  final String name;
  final IconData nameIcon;
  final VoidCallback onTap;
  const OptionModel({this.name, this.nameIcon, this.onTap});
}

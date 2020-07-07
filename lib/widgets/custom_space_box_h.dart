import 'package:flutter/material.dart';

class CustomSpaceBoxH extends StatelessWidget {
  final double height;

  CustomSpaceBoxH(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

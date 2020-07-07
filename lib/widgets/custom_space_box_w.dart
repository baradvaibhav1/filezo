import 'package:flutter/material.dart';

class CustomSpaceBoxW extends StatelessWidget {
  final double width;

  CustomSpaceBoxW(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

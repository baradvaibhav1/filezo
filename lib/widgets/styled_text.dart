import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final textAlign;
  final fontWeight;
  final textColor;
  final alignment;
  final maxLines;
  final textOverflow;
  final bool italics;
  final letterSpacing;
  final height;
  final shadows;
  final bold;

  const StyledText(
    this.text, {
    this.fontSize,
    this.textAlign,
    this.fontWeight = FontWeight.w400,
    this.textColor,
    this.alignment = Alignment.center,
    this.maxLines,
    this.textOverflow,
    this.italics = false,
    this.letterSpacing = 1.0,
    this.height = 1.0,
    this.shadows,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: textOverflow,
        style: TextStyle(
          color: textColor != null ? textColor : const Color(0xff2b313f),
          decoration: TextDecoration.none,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: italics ? FontStyle.italic : FontStyle.normal,
          height: height,
          letterSpacing: letterSpacing,
          shadows: shadows,
        ),
      ),
    );
  }
}

import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class BlazeButton extends StatelessWidget {
  final buttonText;
  final onTap;
  final double height;
  final double width;
  final double fontSize;

  const BlazeButton({Key key, @required this.buttonText, this.onTap, this.height=36, this.width=100, this.fontSize=14.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.ButtonLiteColor,
        child: SizedBox(
          width: width,
          height: height,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onTap,
            child: StyledText(
              buttonText,
              textColor: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

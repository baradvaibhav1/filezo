import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StorageBox extends StatefulWidget {
  @override
  _StorageBoxState createState() => _StorageBoxState();
}

class _StorageBoxState extends State<StorageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: AppColors.shareBtnColorEnd.withOpacity(0.5),
            blurRadius: 16.0, // has the effect of softening the shadow
            spreadRadius: 0.0, // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              6.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: SizedBox(
        width: 184,
        height: 184,
        child: Material(
          color: const Color(0xff4591F2),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/gdrive.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 12,
                        child: Icon(
                          FlutterIcons.dots_three_vertical_ent,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomSpaceBoxH(32),
                StyledText(
                  "Google Drive",
                  alignment: Alignment.centerLeft,
                  textColor: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                CustomSpaceBoxH(12),
                LinearPercentIndicator(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  lineHeight: 6.0,
                  percent: 0.5,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.white,
                ),
                CustomSpaceBoxH(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StyledText(
                      "34.5 GB",
                      alignment: Alignment.center,
                      textColor: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                    StyledText(
                      "80 GB",
                      alignment: Alignment.center,
                      textColor: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StorageBox extends StatelessWidget {
  final StorageBoxData data;
  final onTap;
  final onSettingsTap;
  final double size;

  StorageBox({
    this.data,
    this.onTap,
    this.onSettingsTap,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: data.color.withOpacity(0.75),
              blurRadius: 22.0, // has the effect of softening the shadow
              spreadRadius: -18.0, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
               22.0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: SizedBox(
          width: size,
          height: size,
          child: Material(
            color: data.color,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius:  BorderRadius.circular(12),
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset(
                              data.imgPath,
                              width: 36,
                              height: 36,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onSettingsTap,
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
                      data.boxName,
                      alignment: Alignment.centerLeft,
                      textColor: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    CustomSpaceBoxH(12),
                    LinearPercentIndicator(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      lineHeight: 6.0,
                      percent: data.percentFull,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.white,
                      backgroundColor: Colors.white.withOpacity(0.4),
                    ),
                    CustomSpaceBoxH(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        StyledText(
                          data.usedLabel,
                          alignment: Alignment.center,
                          textColor: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        StyledText(
                          data.totalLabel,
                          alignment: Alignment.center,
                          textColor: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

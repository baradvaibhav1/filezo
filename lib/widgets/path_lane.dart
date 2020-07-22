import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/models/path_box.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/custom_space_box_w.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class PathLane extends StatelessWidget {
  final List<PathBox> pathBoxList;
  final Function(String) pathTap;

  PathLane({@required this.pathBoxList, this.pathTap});

  @override
  Widget build(BuildContext context) {
    //if (widget.pathBoxList.length >= 1)
    //itemScrollController?.jumpTo(index: widget.pathBoxList.length - 1);

    var reversedList = pathBoxList.reversed.toList(growable: false);


    return SizedBox(
      height: 48,
      child: Material(
        color: Colors.grey[300],
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: pathBoxList.length,
            itemBuilder: (BuildContext context, int index) {
              return PathBoxWidget(
                pathBox: reversedList[index],
                active: index == 0 ? true : false,
                onTap: () {
                  pathTap(reversedList[index].path);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class PathBoxWidget extends StatelessWidget {
  const PathBoxWidget({
    Key key,
    @required this.pathBox,
    this.active,
    this.onTap,
  }) : super(key: key);

  final PathBox pathBox;
  final bool active;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          StyledText(
            pathBox.name,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          ),
          Icon(
            EvaIcons.chevronRightOutline,
            size: 28,
            color: AppColors.TextLightColor,
          ),
        ],
      ),
    );
  }
}

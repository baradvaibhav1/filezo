import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/models/path_box.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/custom_space_box_w.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PathLane extends StatelessWidget {
  final List<PathBox> pathBoxList;

  PathLane({@required this.pathBoxList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Material(
        color: Colors.grey[300],
        child: ScrollablePositionedList.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: pathBoxList.length,
          itemBuilder: (BuildContext context, int index) {
            return PathBoxWidget(
              pathBox: pathBoxList[index],
              active: index == pathBoxList.length - 1 ? true : false,
            );
          },
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
  }) : super(key: key);

  final PathBox pathBox;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

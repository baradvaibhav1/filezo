import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/enums/select_type.dart';
import 'package:flutter/material.dart';

class BlazeCheckBox extends StatelessWidget {
  final SelectType selectType;
  final onToggle;

  const BlazeCheckBox({Key key, this.selectType, this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selectType == SelectType.Selected ? Theme.of(context).primaryColorDark : Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          color: selectType == SelectType.Available
              ? Colors.black26
              : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onToggle,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Visibility(
            visible: selectType == SelectType.Selected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Icon(
              EvaIcons.checkmark,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

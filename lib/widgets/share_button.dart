import 'package:fileexplorer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ShareButton extends StatelessWidget {
  final double buttonSize;
  final onTap;

  ShareButton({this.buttonSize = 72, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: AppColors.shareBtnColorEnd,
            blurRadius: 16.0, // has the effect of softening the shadow
            spreadRadius: 0.0, // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              16.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(gradient: new LinearGradient(
                colors: [
                  AppColors.shareBtnColorStart,
                  AppColors.shareBtnColorEnd,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1, 1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: InkWell(
            child: Icon(
              FlutterIcons.paper_plane_faw5s,
              color: Colors.white,
              size: buttonSize * .45,
            ),
            onTap: (){},
          ),
        ),
      ),
    );
  }
}

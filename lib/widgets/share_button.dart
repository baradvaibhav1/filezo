import 'package:fileexplorer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shareBtnColorEnd.withOpacity(.7),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0.0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.shareBtnColorStart,
            AppColors.shareBtnColorEnd
          ], // whitish to gray
          tileMode: TileMode.clamp,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Icon(
          FlutterIcons.paper_plane_faw5s,
          color: Colors.white,
        ),
      ),
    );
  }
}

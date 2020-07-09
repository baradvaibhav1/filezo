import 'package:fileexplorer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class FloatingBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          margin: EdgeInsets.fromLTRB(16,0,16,24),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.shareBtnColorStart.withOpacity(.6),
                blurRadius: 16.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  12, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            gradient: new LinearGradient(
              colors: [
                AppColors.floatAppStart,
                AppColors.floatAppEnd,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(FlutterIcons.send_fea),
                  onPressed: () {},
                  iconSize: 24,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(FlutterIcons.favorite_border_mdi),
                  onPressed: () {},
                  iconSize: 24,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(FlutterIcons.move_fea),
                  onPressed: () {},
                  iconSize: 24,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(FlutterIcons.trash_fea),
                  onPressed: () {},
                  iconSize: 24,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(FlutterIcons.more_vertical_fea),
                  onPressed: () {},
                  iconSize: 24,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

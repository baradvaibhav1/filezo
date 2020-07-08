import 'package:fileexplorer/models/category_item_data.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/category_button.dart';
import 'package:fileexplorer/widgets/share_button.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreationScreenZero extends StatefulWidget {
  @override
  _CreationScreenZeroState createState() => _CreationScreenZeroState();
}

class _CreationScreenZeroState extends State<CreationScreenZero> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: ShareButton(buttonSize: 52,),
        onPressed: (){},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(FlutterIcons.home_faw),
                onPressed: () {},
                iconSize: 24,
              ),
              IconButton(
                icon: Icon(FlutterIcons.game_controller_ent),
                onPressed: () {},
                iconSize: 24,
              ),
              Visibility(
                visible: false,
                child: IconButton(
                  icon: Icon(FlutterIcons.folder_faw5),
                  onPressed: () {},
                  iconSize: 24,
                ),
              ),
              IconButton(
                icon: Icon(FlutterIcons.folder_faw5),
                onPressed: () {},
                iconSize: 24,
              ),
              IconButton(
                icon: Icon(FlutterIcons.settings_fea),
                onPressed: () {},
                iconSize: 24,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShareButton(),
        ),
      ),
    );
  }
}

import 'package:fileexplorer/data/options_data.dart';
import 'package:fileexplorer/models/option_model.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/storage_box_browser.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:path/path.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'custom_space_box_h.dart';

class FloatingBottomBar extends StatelessWidget {
  onTapGesture() {}

  showSheet(context) {
    showModalBottomSheet(
        elevation: 0,
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (BuildContext context) {
          var options = getSheetOptions();
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                //leading: Icon(options[index].nameIcon),
                title: StyledText(
                  options[index].name,
                  alignment: Alignment.centerLeft,
                  fontWeight: FontWeight.w500,
                ),
                onTap: options[index].onTap,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 0,
                color: Colors.grey[300],
                thickness: .8,
              );
            },
          );
        });
  }

  List<OptionModel> getSheetOptions() {
    List<OptionModel> list = [
      Options.Hide,
      Options.Copy,
      Options.Rename,
      Options.Compress,
      Options.Details,
      Options.OpenInAnotherApp,
    ];
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StorageBoxBrowser(),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 24),
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
                  onPressed: () {
                    showSheet(context);
                  },
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
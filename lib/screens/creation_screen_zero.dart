import 'package:fileexplorer/models/category_item_data.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/category_button.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/custom_space_box_w.dart';
import 'package:fileexplorer/widgets/item_list_tile.dart';
import 'package:fileexplorer/widgets/share_button.dart';
import 'package:fileexplorer/widgets/share_button.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

const TABLEROWPAD = 24.0;

class CreationScreenZero extends StatefulWidget {
  @override
  _CreationScreenZeroState createState() => _CreationScreenZeroState();
}

class _CreationScreenZeroState extends State<CreationScreenZero> {
  int _currentIndex = 0;

  //String textValue = "folder1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(FlutterIcons.plus_faw5s),
        onPressed: () {
          fileDetails(context);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
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
    );
  }
}

fileDetails(context) {
  showModalBottomSheet(
      elevation: 0,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(24, 50, 16, 24),
                child: Table(
                  border: null,
                  children: [
                    TableRow(
                      children: [
                        StyledText(
                          'Name:',
                          fontSize: 16,
                          alignment: Alignment.centerLeft,
                        ),
                        StyledText(
                          'Airdroid',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                    TableRow(children: [
                      CustomSpaceBoxH(TABLEROWPAD),
                      CustomSpaceBoxH(TABLEROWPAD),
                    ]),
                    TableRow(
                      children: [
                        StyledText(
                          'Location:',
                          fontSize: 16,
                          alignment: Alignment.centerLeft,
                        ),
                        StyledText(
                          '/storage/emulated/0/AirDroid',
                          textColor: Color(0xFF456AEF),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                    TableRow(children: [
                      CustomSpaceBoxH(TABLEROWPAD),
                      CustomSpaceBoxH(TABLEROWPAD),
                    ]),
                    TableRow(children: [
                      StyledText(
                        'Items:',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                      StyledText(
                        '572 Items',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                    ]),
                    TableRow(children: [
                      CustomSpaceBoxH(TABLEROWPAD),
                      CustomSpaceBoxH(TABLEROWPAD),
                    ]),
                    TableRow(children: [
                      StyledText(
                        'Size:',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                      StyledText(
                        '8.61 MB',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                    ]),
                    TableRow(children: [
                      CustomSpaceBoxH(TABLEROWPAD),
                      CustomSpaceBoxH(TABLEROWPAD),
                    ]),
                    TableRow(children: [
                      StyledText(
                        'Last Modified: ',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                      StyledText(
                        '28/08/19 3:44 AM',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                    ]),
                    TableRow(children: [
                      CustomSpaceBoxH(TABLEROWPAD),
                      CustomSpaceBoxH(TABLEROWPAD),
                    ]),
                    TableRow(children: [
                      StyledText(
                        'Hidden: ',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                      StyledText(
                        'No',
                        fontSize: 16,
                        alignment: Alignment.centerLeft,
                      ),
                    ]),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.6,
                height: 0,
              ),
              ListTile(
                title: StyledText(
                  'CLOSE',
                  textColor: Colors.black,
                  fontSize: 18,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                contentPadding: const EdgeInsets.fromLTRB(0,4,0,12),
              ),
            ],
          ),
        );
      });
}

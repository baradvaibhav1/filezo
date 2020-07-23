import 'package:fileexplorer/enums/select_type.dart';
import 'package:fileexplorer/models/category_item_data.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/blaze_button.dart';
import 'package:fileexplorer/widgets/blaze_check_box.dart';
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
import 'package:path/path.dart';

const TABLEROWPAD = 24.0;
const TABLEROWPAD2 = 16.0;
const TABLEROWPAD3 = 12.0;

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
          rootFilePermission(context);
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
                contentPadding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
              ),
            ],
          ),
        );
      });
} //Extract dis

rootFilePermission(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(24,0,8,0),
                child: Column(
                  children: <Widget>[
                    CustomSpaceBoxH(32),
                    Table(
                      columnWidths: {0: FractionColumnWidth(.3)},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            Visibility(
                              child: StyledText(
                                'PlaceHolder',
                                fontSize: 16,
                              ),
                              visible: false,
                            ),
                            StyledText(
                              'S',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            StyledText(
                              'R',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            StyledText(
                              'W',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            StyledText(
                              'X',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                          ],
                        ),
                        TableRow(
                          children: [
                            StyledText(
                              'Owner',
                              fontSize: 16,
                              alignment: Alignment.bottomLeft,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Selected,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Selected,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                          ],
                        ),
                        TableRow(
                          children: [
                            StyledText(
                              'Group',
                              fontSize: 16,
                              alignment: Alignment.bottomLeft,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Selected,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                            CustomSpaceBoxH(TABLEROWPAD2),
                          ],
                        ),
                        TableRow(
                          children: [
                            StyledText(
                              'Others',
                              fontSize: 16,
                              alignment: Alignment.bottomLeft,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Selected,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                            BlazeCheckBox(
                              selectType: SelectType.Available,
                              padding: 4.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomSpaceBoxH(16),
                    Table(
                      columnWidths: {0: FractionColumnWidth(.3)},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          StyledText(
                            '644',
                            alignment: Alignment.centerLeft,
                            textColor: Colors.grey,
                          ),
                          StyledText(
                            'lrw-r--r--',
                            alignment: Alignment.centerLeft,
                            textColor: Colors.grey,
                          ),
                        ]),
                      ],
                    ),
                    CustomSpaceBoxH(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        BlazeCheckBox(
                          selectType: SelectType.Available,
                        ),
                        CustomSpaceBoxW(12),
                        StyledText(
                          'Recursive',
                          fontSize: 18,
                        ),
                        CustomSpaceBoxW(32),
                        BlazeButton(buttonText: 'APPLY',onTap: (){},),
                        CustomSpaceBoxW(16),
                      ],
                    ),
                    CustomSpaceBoxH(32),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 0.4,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24,0,8,0),
                child: Column(
                  children: <Widget>[
                    CustomSpaceBoxH(32),
                    StyledText(
                      'Owner and group',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,16,16,16),
                      child: Table(
                        columnWidths: {2: FractionColumnWidth(.3)},
                        //defaultColumnWidth: FractionColumnWidth(.3),
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            StyledText(
                              'Owner',
                              fontSize: 16,
                              alignment: Alignment.centerLeft,
                              fontWeight: FontWeight.w600,
                            ),
                            StyledText('root',
                                fontSize: 16,
                                alignment: Alignment.centerLeft,
                                fontWeight: FontWeight.w400),
                            BlazeButton(buttonText: 'APPLY',onTap: (){},),
                          ]),
                          TableRow(
                            children: [
                              CustomSpaceBoxH(TABLEROWPAD3),
                              CustomSpaceBoxH(TABLEROWPAD3),
                              CustomSpaceBoxH(TABLEROWPAD3),
                            ],
                          ),
                          TableRow(children: [
                            StyledText(
                              'Group',
                              fontSize: 16,
                              alignment: Alignment.centerLeft,
                              fontWeight: FontWeight.w600,
                            ),
                            StyledText('root',
                                fontSize: 16,
                                alignment: Alignment.centerLeft,
                                fontWeight: FontWeight.w400),
                            BlazeButton(buttonText: 'APPLY',onTap: (){},),
                          ]),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        BlazeCheckBox(
                          selectType: SelectType.Available,
                        ),
                        CustomSpaceBoxW(12),
                        StyledText(
                          'Recursive',
                          fontSize: 18,
                        ),
                        CustomSpaceBoxW(32),
                        BlazeButton(buttonText: 'APPLY',onTap: (){},),
                        CustomSpaceBoxW(16),
                      ],
                    ),
                    CustomSpaceBoxH(32),
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
                contentPadding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              ),
            ],
          ),
        );
      });
} //Extract dis

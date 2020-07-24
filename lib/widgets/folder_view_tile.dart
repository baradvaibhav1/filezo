import 'dart:io';

import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/enums/select_type.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:fileexplorer/widgets/blaze_check_box.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

const double ICON_SIZE = 40.0;

class FolderViewTile extends StatelessWidget {
  final BlazeFileEntity file;
  final onTap;
  final onLongPress;
  final SelectType selectType;

  const FolderViewTile({
    Key key,
    this.file,
    this.onTap,
    this.onLongPress,
    this.selectType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isFolder = FileUtils.isBlazeFolder(file);
    var isImage = FileUtils.isBlazeImage(file);
    return Column(
      children: <Widget>[
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          onTap: onTap,
          onLongPress: onLongPress,
          leading: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              height: ICON_SIZE,
              width: ICON_SIZE,
              child: Stack(
                children: <Widget>[
                  isImage
                      ? Center(
                          child: Image.file(
                            File(file.path),
                            fit: BoxFit.cover,
                            height: ICON_SIZE,
                            width: ICON_SIZE,
                            cacheHeight: 48,
                          ),
                        )
                      : Image.asset(
                          !isFolder
                              ? FileUIUtils.getFileIconFromCategory(
                                  file.category)
                              : "assets/images/folder.png",
                          height: ICON_SIZE,
                          width: ICON_SIZE,
                        ),
                  StyledText(
                    !isFolder && !isImage ? file.extension : "",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          title: StyledText(
            file.name,
            alignment: Alignment.topLeft,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.0,
            maxLines: 1,
            textColor: Colors.black,
            textOverflow: TextOverflow.ellipsis,
          ),
          subtitle: Row(
            children: <Widget>[
              Visibility(
                child: StyledText(
                  "${file.filesInsideCount} items",
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                  textColor: Colors.grey[400],
                ),
                visible: isFolder,
              ),
              Visibility(
                child: StyledText(
                  '  |  ',
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                  textColor: Colors.grey[400],
                ),
                visible: isFolder,
              ),
              StyledText(
                FileUtils.formatTime(file.timestamp),
                fontWeight: FontWeight.w300,
                fontSize: 12,
                textColor: Colors.grey[400],
              ),
              StyledText(
                '  |  ',
                fontWeight: FontWeight.w300,
                fontSize: 14,
                textColor: Colors.grey[400],
              ),
              Flexible(
                child: StyledText(
                  file.size,
                  alignment: Alignment.centerLeft,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  textColor: Colors.grey[400],
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: BlazeCheckBox(
            selectType: selectType,
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

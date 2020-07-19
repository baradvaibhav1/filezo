import 'dart:io';

import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FolderViewTile extends StatelessWidget {
  final BlazeFileEntity file;
  final onTap;

  const FolderViewTile({
    Key key,
    this.file,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isFolder = FileUtils.isBlazeFolder(file);
    var isImage = FileUtils.isBlazeImage(file);
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          onTap: onTap,
          onLongPress: () {},
          leading: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              height: 48,
              width: 48,
              child: Stack(
                children: <Widget>[
                  isImage
                      ? Center(
                          child: Image.file(
                            file.file,
                            fit: BoxFit.cover,
                            height: 48,
                            width: 48,
                          ),
                        )
                      : Image.asset(
                          !isFolder
                              ? FileUIUtils.getFileIconFromCategory(file.category)
                              : "assets/images/folder.png",
                          height: 48,
                          width: 48,
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
          title: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: StyledText(
              file.name,
              alignment: Alignment.topLeft,
              fontWeight: FontWeight.w300,
              fontSize: 16,
              letterSpacing: 0.0,
              maxLines: 1,
              textColor: Colors.black,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
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
                StyledText(
                  file.size,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  textColor: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

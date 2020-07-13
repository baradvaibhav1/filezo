import 'dart:io';

import 'package:fileexplorer/models/blaze_block.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/custom_space_box_w.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class ImageAlbumWidget extends StatelessWidget {
  final BlazeBlock block;
  final onTap;
  final onSettingsTap;

  ImageAlbumWidget(
    this.block, {
    this.onTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: GridTile(
        footer: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                CustomSpaceBoxW(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    StyledText(block.name,
                    fontSize: 12,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                    CustomSpaceBoxH(4),
                    StyledText("${block.fileCount} items",
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      textColor: Colors.grey,
                      alignment: Alignment.centerLeft,

                      textAlign: TextAlign.left,
                    ),
                    CustomSpaceBoxH(16),

                  ],
                ),
              ],
            ),
          ),
        ),
        child: FadeInImage(
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 300),
          fit: BoxFit.cover,
          placeholder: MemoryImage(FileUtils.placeHolder),
          image: FileImage(
            block.list[0].file,
          ),
        ),
      ),
    );
  }
}

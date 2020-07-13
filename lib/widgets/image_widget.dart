import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final BlazeFileEntity file;
  final onTap;

  ImageWidget(this.file, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: GridTile(
          footer: Container(
            height: 32,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black12,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          child: Hero(
            tag: file.path,
            child: Image.file(
              file.file,
              fit: BoxFit.cover,
              cacheHeight: file.cacheHeight,
              cacheWidth: file.cacheWidth,
            ),
          ),
        ),
      ),
    );
  }
}

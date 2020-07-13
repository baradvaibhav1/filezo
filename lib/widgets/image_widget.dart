import 'dart:io';

import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final BlazeFileEntity file;
  final onTap;

  ImageWidget(this.file, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: file.path,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap ,
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
            child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
              placeholder: MemoryImage(FileUtils.placeHolder),
              image: FileImage(
                file.file,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

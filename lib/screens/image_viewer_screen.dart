import 'package:fileexplorer/models/blaze_block.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewerScreen extends StatefulWidget {
  final BlazeBlock block;
  final initialIndex;

  ImageViewerScreen(this.block, this.initialIndex);

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {

  PageController _pageController;

  @override
  void initState() {

    _pageController = PageController(initialPage: widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: PhotoViewGallery.builder(
          pageController: _pageController,
          itemCount: widget.block.fileCount,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              heroAttributes: PhotoViewHeroAttributes(tag: widget.block.list[index].path),
              imageProvider: FileImage(widget.block.list[index].file),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fileexplorer/data/storage_boxes.dart';
import 'package:fileexplorer/enums/boxtypes.dart';
import 'package:fileexplorer/screens/box_carousel.dart';
import 'package:fileexplorer/widgets/custom_space_box_w.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/material.dart';

class CreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BoxCarousel(
        storageBoxes: [
          StorageBoxes.getData(BoxType.InternalStorage),
          StorageBoxes.getData(BoxType.ExternalStorage),
          StorageBoxes.getData(BoxType.GoogleDrive),
        ],
      ),
    );
  }
}

import 'package:fileexplorer/models/storage_box_data.dart';
import 'package:fileexplorer/screens/folder_screen.dart';
import 'package:fileexplorer/screens/image_category_screen.dart';
import 'package:fileexplorer/widgets/custom_space_box_w.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/material.dart';

class BoxCarousel extends StatelessWidget {
  final List<StorageBoxData> storageBoxes;

  const BoxCarousel({
    Key key,
    this.storageBoxes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        scrollDirection: Axis.horizontal,
        itemCount: storageBoxes.length,
        itemBuilder: (BuildContext context, int index) {
          return StorageBox(data: storageBoxes[index], onTap: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                //transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (_, __, ___) => FolderScreen(storageBoxes[index].path),
              ),
            );
          },);
        },
        separatorBuilder: (BuildContext context, int index) {
          return CustomSpaceBoxW(16);
        },
      ),
    );
  }
}

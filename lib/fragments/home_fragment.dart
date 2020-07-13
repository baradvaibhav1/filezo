import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/data/storage_boxes.dart';
import 'package:fileexplorer/enums/boxtypes.dart';
import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/widgets/box_carousel.dart';
import 'package:fileexplorer/widgets/category_grid.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/heading_row.dart';
import 'package:fileexplorer/widgets/item_list_tile.dart';
import 'package:fileexplorer/widgets/loading_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = _getWidgetList(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: 32,
          icon: Icon(
            EvaIcons.menu,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 26,
            icon: Icon(
              EvaIcons.searchOutline,
            ),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 26,
            icon: Icon(
              EvaIcons.moreVerticalOutline,
            ),
            onPressed: () {},
          ),
        ],

      ),
      body: ListView.builder(
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          if (widgetList[index] is! Divider &&
              widgetList[index] is! BoxCarousel &&
              widgetList[index] is! ListView)
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: widgetList[index],
            );
          else
            return widgetList[index];
        },
      ),
    );
  }

  List<Widget> _getWidgetList(BuildContext context) {
    BaseProvider baseProvider =
        Provider.of<BaseProvider>(context, listen: true);

    var isLoadingComplete = baseProvider.initLoadingComplete;

    List<Widget> list = [
      CustomSpaceBoxH(24),
      BoxCarousel(
        storageBoxes: [
          StorageBoxes.getData(BoxType.InternalStorage),
          StorageBoxes.getData(BoxType.ExternalStorage),
          StorageBoxes.getData(BoxType.GoogleDrive),
          StorageBoxes.getData(BoxType.OneDrive),
        ],
      ),
      CustomSpaceBoxH(16),
      HeadingRow(
        headingText: "Categories",
      ),
      CustomSpaceBoxH(36),
      CategoryGrid(),
      CustomSpaceBoxH(48),
      HeadingRow(
        headingText: "Recents",
      ),
      CustomSpaceBoxH(24),
      ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: isLoadingComplete ? baseProvider.recentFiles.length : 5,
        itemBuilder: (BuildContext context, int index) {
          return isLoadingComplete
              ? BlazeItemTile(file: baseProvider.recentFiles[index])
              : LoadingListTile();
        },
        separatorBuilder: (BuildContext context, int index) {
          return CustomSpaceBoxH(8);
        },
      ),
    ];

    return list;
  }
}

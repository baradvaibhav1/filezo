import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/models/blaze_block.dart';
import 'package:fileexplorer/models/blaze_category.dart';
import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/screens/image_viewer_screen.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/image_album_widget.dart';
import 'package:fileexplorer/widgets/image_widget.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BaseProvider baseProvider = Provider.of<BaseProvider>(context);

    BlazeCategory imageCategory =
        baseProvider.getBlazeCategory(FileCategory.Image);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 1,
            title: StyledText("Images"),
            actions: <Widget>[
              IconButton(
                iconSize: 26,
                icon: Icon(
                  EvaIcons.moreVerticalOutline,
                ),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).textTheme.bodyText1.color,
              labelColor: Theme.of(context).textTheme.bodyText1.color,
              unselectedLabelColor: Theme.of(context).textTheme.caption.color,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: "Images",
                ),
                Tab(
                  text: "Albums",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ImagesTab(imageCategory: imageCategory),
              AlbumTab(imageCategory),
            ],
          )),
    );
  }
}

class ImagesTab extends StatelessWidget {
  const ImagesTab({
    Key key,
    @required this.imageCategory,
  }) : super(key: key);

  final BlazeCategory imageCategory;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 36),
      itemCount: imageCategory.dateWiseList.length,
      itemBuilder: (BuildContext context, int index) {
        BlazeBlock block = imageCategory.dateWiseList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StyledText(
                block.name,
                fontSize: 16,
                alignment: Alignment.centerLeft,
                textColor: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              CustomSpaceBoxH(24),
              GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: block.fileCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return ImageWidget(
                    block.list[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder: (_, __, ___) => ImageViewerScreen(block,index),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          height: 72,
          color: Colors.grey[100],
        );
      },
    );
  }
}

class AlbumTab extends StatelessWidget {
  final BlazeCategory blazeCategory;

  AlbumTab(this.blazeCategory);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 36, 16, 36),
      itemCount: blazeCategory.blockList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return ImageAlbumWidget(
          blazeCategory.blockList[index],
          onTap: () {},
        );
      },
    );
  }
}

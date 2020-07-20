import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/providers/folder_provider.dart';
import 'package:fileexplorer/widgets/folder_view_tile.dart';
import 'package:fileexplorer/widgets/item_list_tile.dart';
import 'package:fileexplorer/widgets/loading_list_tile.dart';
import 'package:fileexplorer/widgets/path_lane.dart';
import 'package:fileexplorer/widgets/storage_box_browser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FolderScreen extends StatefulWidget {
  final String path;

  FolderScreen(this.path);

  @override
  _FolderScreenState createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  void initState() {
    FolderProvider folderProvider =
        Provider.of<FolderProvider>(context, listen: false);

    changeFolder(folderProvider);
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<FolderProvider>(context, listen: false).resetPathBox();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FolderProvider folderProvider = Provider.of<FolderProvider>(context);

    print("Building ${folderProvider.currentBlazeList.length}");

    var pathKey = folderProvider.getPathKey(folderProvider.currentPath);

    return WillPopScope(
      onWillPop: () async {
        return folderProvider.handlePop();
      },
      child: Scaffold(
        body: CustomScrollView(
          key: pathKey.key,
          slivers: <Widget>[
            SliverAppBar(
              forceElevated: true,
              elevation: 1,
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
            SliverToBoxAdapter(
              child: PathLane(
                pathBoxList: folderProvider.pathBoxList,
                pathTap: (path) {
                  folderProvider.goToPath(path);
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var blazeFile = folderProvider.currentBlazeList[index];
                  return folderProvider.isFree()
                      ? FolderViewTile(
                          file: blazeFile,
                          onTap: () {
                            folderProvider.onTap(index);
                          },
                          onLongPress: () {
                            folderProvider.onLongPress(index);
                          },
                          selectType: blazeFile.selectType,
                        )
                      : const LoadingListTile();
                },
                childCount: folderProvider.isFree()
                    ? folderProvider.currentBlazeList.length
                    : 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeFolder(FolderProvider folderProvider) async {
    await folderProvider.updateFolderData(widget.path);
  }
}

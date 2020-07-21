import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/providers/folder_provider.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/folder_view_tile.dart';
import 'package:fileexplorer/widgets/item_list_tile.dart';
import 'package:fileexplorer/widgets/loading_list_tile.dart';
import 'package:fileexplorer/widgets/path_lane.dart';
import 'package:fileexplorer/widgets/storage_box_browser.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class FolderScreen extends StatefulWidget {
  final String path;

  FolderScreen(this.path);

  @override
  _FolderScreenState createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    offset = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(controller);

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
        return folderProvider.handlePop(onSelectStopped: () {
          controller.reverse();
        });
      },
      child: Scaffold(
        extendBody: true,
        body: CustomScrollView(
          key: pathKey.key,
          slivers: <Widget>[
            !folderProvider.isSelectAvailable()
                ? SliverAppBar(
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
                  )
                : SliverAppBar(
                    forceElevated: true,
                    elevation: 1,
                    backgroundColor: AppColors.shareBtnColorStart,
                    leading: IconButton(
                      iconSize: 28,
                      icon: Icon(
                        EvaIcons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        folderProvider.handlePop(onSelectStopped: () {
                          controller.reverse();
                        });
                      },
                    ),
                    title: StyledText(
                      "${folderProvider.selectedList.length} items selected",
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    actions: <Widget>[
                      IconButton(
                        iconSize: 24,
                        icon: Icon(
                          folderProvider.isAllSelected()
                              ? EvaIcons.minusCircleOutline
                              : EvaIcons.checkmarkCircleOutline,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          folderProvider.isAllSelected()
                              ? folderProvider.unSelectAll()
                              : folderProvider.selectAll();
                        },
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
                            /*switch (controller.status) {
                              case AnimationStatus.completed:
                                controller.reverse();
                                break;
                              case AnimationStatus.dismissed:
                                controller.forward();
                                break;
                              default:
                            }*/
                            var firstSelect = folderProvider.onLongPress(index);

                            if (firstSelect) controller.forward();
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
        bottomNavigationBar: SlideTransition(
          position: offset,
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 24),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shareBtnColorStart.withOpacity(.6),
                    blurRadius: 16.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      12, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                gradient: new LinearGradient(
                    colors: [
                      AppColors.floatAppStart,
                      AppColors.floatAppEnd,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FlutterIcons.send_fea),
                      onPressed: () {},
                      iconSize: 24,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(FlutterIcons.favorite_border_mdi),
                      onPressed: () {},
                      iconSize: 24,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(FlutterIcons.move_fea),
                      onPressed: () {},
                      iconSize: 24,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(FlutterIcons.trash_fea),
                      onPressed: () {},
                      iconSize: 24,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(FlutterIcons.more_vertical_fea),
                      onPressed: () {
                        // showSheet(context);
                      },
                      iconSize: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  changeFolder(FolderProvider folderProvider) async {
    await folderProvider.updateFolderData(widget.path);
  }
}

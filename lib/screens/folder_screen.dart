import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/providers/folder_provider.dart';
import 'package:fileexplorer/widgets/item_list_tile.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FolderProvider folderProvider = Provider.of<FolderProvider>(context);

    changeFolder(folderProvider);

    return Scaffold(
      body: CustomScrollView(
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
            child: StorageBoxBrowser(
              storageBox: folderProvider.currentBox,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return BlazeItemTile();
              },
            ),
          ),
        ],
      ),
    );
  }

  changeFolder(FolderProvider folderProvider) async {
    await folderProvider.updateFolderData(widget.path);
  }
}

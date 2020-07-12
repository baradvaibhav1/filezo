import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fileexplorer/providers/base_provider.dart';
import 'package:fileexplorer/widgets/image_widget.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BaseProvider baseProvider = Provider.of<BaseProvider>(context);

    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: GridView.builder(
          itemCount: baseProvider.imagesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 1,
              crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return ImageWidget(
              null,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

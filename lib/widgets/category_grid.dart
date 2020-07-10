import 'package:fileexplorer/data/category_items.dart';
import 'package:fileexplorer/widgets/category_button.dart';
import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CategoryButton(
              data: CategoryItems.Images,
            ),
            CategoryButton(
              data: CategoryItems.Videos,
            ),
            CategoryButton(
              data: CategoryItems.Docs,
            ),
            CategoryButton(
              data: CategoryItems.Downloads,
            ),
          ],
        ),
        CustomSpaceBoxH(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            CategoryButton(
              data: CategoryItems.Music,
            ),
            CategoryButton(
              data: CategoryItems.Archives,
            ),
            CategoryButton(
              data: CategoryItems.APKs,
            ),
            CategoryButton(
              data: CategoryItems.Screenshots,
            ),
          ],
        ),
      ],
    );
  }
}

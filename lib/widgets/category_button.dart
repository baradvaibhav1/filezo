import 'package:fileexplorer/models/category_item_data.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final double size;
  final CategoryItemData data;

  CategoryButton({
    this.size = 54,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            margin: EdgeInsets.fromLTRB(
              size / 10,
              size / 10,
              size / 10,
              size / 5,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: data.color.withOpacity(.6),
                  blurRadius: size / 6, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    size / 22, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Image.asset(data.imgPath),
          ),
          StyledText(
            data.text,
            fontSize: size / 5,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
          ),
        ],
      ),
    );
  }
}

import 'package:fileexplorer/models/category_item_data.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final double size;
  final CategoryItemData data;
  final onTap;

  CategoryButton({
    this.size = 64,
    this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: size*1.16,
        child: Column(
          children: <Widget>[
            Container(
              width: size,
              height: size,
              margin: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                size / 5,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: data.color.withOpacity(.4),
                    blurRadius: size / 7, // soften the shadow
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
              fontSize: size /5.8,
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 1,
              fontWeight: FontWeight.w400,
              letterSpacing: .5,
            ),
          ],
        ),
      ),
    );
  }
}

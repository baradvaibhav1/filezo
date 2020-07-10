import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      onTap: () {},
      onLongPress: () {},
      leading: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: SizedBox(
          height: 48,
          width: 48,
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/music_file.png",
                height: 48,
                width: 48,
              ),
              StyledText(
                ".mp3",
                fontWeight: FontWeight.w500,
                fontSize: 10,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: StyledText(
          'Presentation',
          alignment: Alignment.topLeft,
          fontWeight: FontWeight.w300,
          fontSize: 18,
          letterSpacing: 0.0,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Visibility(
              child: StyledText(
                'itemCount',
                fontWeight: FontWeight.w100,
                fontSize: 12,
                textColor: Colors.grey[400],
              ),
              visible: true,
            ),
            Visibility(
              child: StyledText(
                '  |  ',
                fontWeight: FontWeight.w100,
                fontSize: 12,
                textColor: Colors.grey[400],
              ),
              visible: true,
            ),
            StyledText(
              '12 Mins Ago',
              fontWeight: FontWeight.w300,
              fontSize: 12,
              textColor: Colors.grey[400],
            ),
            StyledText(
              '  |  ',
              fontWeight: FontWeight.w300,
              fontSize: 14,
              textColor: Colors.grey[400],
            ),
            StyledText(
              'fileSize',
              fontWeight: FontWeight.w300,
              fontSize: 12,
              textColor: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}

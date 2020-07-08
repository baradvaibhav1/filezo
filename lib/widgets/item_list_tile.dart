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
      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      onTap: () {},
      onLongPress: () {},
      leading: Icon(
        FlutterIcons.folder_faw5s,
        size: 60,
        color: Color(0xFFFFD26E),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: StyledText(
          'textValue',
          alignment: Alignment.topLeft,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Visibility(
              child: StyledText(
                'itemCount',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              visible: true,
            ),
            Visibility(
              child: StyledText(
                '  |  ',
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
              visible: true,
            ),
            StyledText(
              'timeStamp',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            StyledText(
              '  |  ',
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
            StyledText(
              'fileSize',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}

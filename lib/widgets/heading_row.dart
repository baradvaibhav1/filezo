import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class HeadingRow extends StatelessWidget {
  final String headingText;
  final List<Widget> actions;

  const HeadingRow({
    @required this.headingText,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        StyledText(
          headingText,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          alignment: Alignment.centerLeft,
        ),
        Expanded(
          child: SizedBox(),
        ),
        actions != null
            ? Row(
                children: <Widget>[
                  for (var i in actions)
                    i,
                ],
              )
            : Spacer(),
      ],
    );
  }
}

import 'package:fileexplorer/widgets/custom_space_box_h.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StorageBoxBrowser extends StatelessWidget {
  const StorageBoxBrowser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  StyledText(
                    'Storage',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    alignment: Alignment.centerLeft,
                  ),
                  StyledText(
                    '  >',
                    fontSize: 16,
                    textColor: Colors.grey[500],
                    fontWeight: FontWeight.w700,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
              CustomSpaceBoxH(12),
              LinearPercentIndicator(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                lineHeight: 6.0,
                percent: .5,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.amber[400],
                backgroundColor: Colors.white.withOpacity(0.4),
              ),
              CustomSpaceBoxH(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StyledText(
                    '30.5 GB',
                    alignment: Alignment.center,
                    textColor: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  StyledText(
                    '128 GB',
                    alignment: Alignment.center,
                    textColor: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

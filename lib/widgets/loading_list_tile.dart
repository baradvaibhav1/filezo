import 'dart:io';

import 'package:fileexplorer/enums/file_entity_type.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';
import 'package:fileexplorer/utils/file_ui_utils.dart';
import 'package:fileexplorer/utils/file_utils.dart';
import 'package:fileexplorer/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListTile extends StatelessWidget {

  const LoadingListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.grey[100],
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        onLongPress: () {},
        leading: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: SizedBox(
            height: 48,
            width: 48,
            child: Material(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            height: 16,
            child: Material(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            height: 16,
            child: Material(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}

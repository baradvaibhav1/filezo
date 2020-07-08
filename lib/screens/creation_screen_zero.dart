import 'package:fileexplorer/models/category_item_data.dart';
import 'file:///D:/Projects/Current%20Projects/file_explorer/lib/widgets/share_button.dart';
import 'package:fileexplorer/theme/app_colors.dart';
import 'package:fileexplorer/widgets/category_button.dart';
import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreationScreenZero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ShareButton(),
        ),
      ),
    );
  }
}

import 'package:fileexplorer/widgets/storage_box.dart';
import 'package:flutter/material.dart';

class CreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StorageBox(),
        ),
      ),
    );
  }
}

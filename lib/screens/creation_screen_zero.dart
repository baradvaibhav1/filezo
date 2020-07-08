import 'package:fileexplorer/widgets/share_button.dart';
import 'package:flutter/material.dart';

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

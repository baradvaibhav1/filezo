import 'package:flutter/material.dart';

class StorageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 192,
      height: 192,
      child: Material(
        color: const Color(0xff4591F2),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppNameArea extends StatelessWidget {
  AppNameArea({
    required this.imagePath,
    super.key,
  });

  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 32.0, bottom: 16.0),
      child: Image.asset(imagePath),
    );
  }
}

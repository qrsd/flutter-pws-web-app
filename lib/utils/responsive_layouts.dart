import 'package:flutter/material.dart';

class ResponsiveLayout {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 940;
  }
}

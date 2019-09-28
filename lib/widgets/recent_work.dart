import 'package:flutter/material.dart';

class RecentWork extends StatelessWidget {
  final String imagePath;
  RecentWork(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {},
      onTapUp: (TapUpDetails details) {},
      onTap: () {},
      child: SizedBox(
        child: Image.asset(
          this.imagePath,
        ),
      ),
    );
  }
}

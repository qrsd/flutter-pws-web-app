import 'package:flutter/material.dart';

class PortfolioImages extends StatelessWidget {
  final String imagePath;
  PortfolioImages(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {},
      onTapUp: (TapUpDetails details) {},
      onTap: () {},
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset(this.imagePath),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/fade_route.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/land_page_middle.dart';
import '../widgets/nav_bar.dart';
import '../widgets/side_drawer.dart';

class Home extends StatefulWidget {
  static Route<dynamic> route() {
    return FadeRoute(
      name: '/',
      title: 'Home Page',
      builder: (_) => Home(),
    );
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFF8FBFF), Color(0xFFCFDFD)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: NavBar(height: 150),
        endDrawer: SideDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Carousel(),
              MiddleSection(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

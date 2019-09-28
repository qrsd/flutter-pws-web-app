import 'package:flutter/material.dart';

import '../pages/about.dart';
import '../pages/contact_us.dart';
import '../pages/home.dart';
import '../pages/portfolio.dart';
import '../utils/responsive_layouts.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isSmallScreen(context))
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.5, //20.0,
        child: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("DRAWER HEADER.."),
              decoration: BoxDecoration(color: Colors.orange),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacement(Home.route());
              },
            ),
            ListTile(
              title: Text('Portfolio'),
              onTap: () {
                Navigator.of(context).pushReplacement(Portfolio.route());
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pushReplacement(About.route());
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                Navigator.of(context).pushReplacement(ContactUs.route());
              },
            ),
          ],
        )),
      );
    else
      return Container();
  }
}

import 'package:flutter/material.dart';

import '../pages/about.dart';
import '../pages/contact_us.dart';
import '../pages/home.dart';
import '../pages/portfolio.dart';
import '../utils/constants.dart';
import '../utils/responsive_layouts.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;

  const NavBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void navChoice(String choice) async {
    switch (choice) {
      case 'Home':
        Navigator.of(context).pop();
        Navigator.of(context).push(Home.route());
        break;
      case 'Portfolio':
        Navigator.of(context).pop();
        Navigator.of(context).push(Portfolio.route());
        break;
      case 'About Us':
        Navigator.of(context).pop();
        Navigator.of(context).push(About.route());
        break;
      case 'Contact Us':
        Navigator.of(context).pop();
        Navigator.of(context).push(ContactUs.route());
        break;
    }
  }

  List<Widget> navButtons() {
    return navLists.map((text) {
      return SizedBox(
        height: 40,
        width: 150,
        child: RaisedButton(
            textColor: Colors.black,
            padding: EdgeInsets.all(7),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            focusColor: Colors.red,
            color: Color(0xFFFDFEFE),
            hoverColor: Color(0xFF57565C),
            onPressed: () {
              navChoice(text);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 20),
            )),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('images/icons/architect.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text('PWS General\nConstruction',
                  style: TextStyle(fontSize: 26, fontFamily: 'Roboto'))
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: navButtons(),
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PopupMenuButton(
                  onSelected: navChoice,
                  icon: Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  tooltip: 'Menu',
                  itemBuilder: (BuildContext context) {
                    return navLists.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: Text(
                          choice,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            )
        ],
      ),
    );
  }
}

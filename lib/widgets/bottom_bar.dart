import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import '../utils/constants.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color(0xFF222222),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    html.window.location.href = 'tel://+1$phoneCleaned';
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: ImageIcon(
                          AssetImage('images/icons/smartphone.png'),
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        phone,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    html.window.location.href = 'mailto:$email.com';
                  },
                  child: Column(
                    children: <Widget>[
                      ImageIcon(
                        AssetImage('images/icons/email.png'),
                        size: 80,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        email,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF434343),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  copyRight,
                  style: TextStyle(color: Colors.white),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      creator,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      iconDev,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

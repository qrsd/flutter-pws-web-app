import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/fade_route.dart';
import '../utils/responsive_layouts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/nav_bar.dart';

class About extends StatefulWidget {
  static Route<dynamic> route() {
    return FadeRoute(
      name: '/about',
      title: 'About',
      builder: (_) => About(),
    );
  }

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFF8FBFF), Color(0xFFCFDFD)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: NavBar(height: 150),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Container(
                      width: !ResponsiveLayout.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * .22
                          : MediaQuery.of(context).size.width * .75,
                      height: MediaQuery.of(context).size.height * .4,
                      child: Carousel2(),
                    ),
                    SizedBox(
                      width: !ResponsiveLayout.isSmallScreen(context) ? 50 : 0,
                    ),
                    Container(
                      width: !ResponsiveLayout.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * .22
                          : MediaQuery.of(context).size.width * .75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'About Us',
                            style: bold20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              aboutMessage,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: !ResponsiveLayout.isSmallScreen(context)
                                ? 50
                                : 20,
                          ),
                          Text(
                            'Services',
                            style: bold20,
                          ),
                          SizedBox(
                            height: !ResponsiveLayout.isSmallScreen(context)
                                ? 10
                                : 0,
                          ),
                          Container(
                            child: Text(
                              services,
                              style: TextStyle(
                                fontSize: 16,
                                height: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Container(
                      width: !ResponsiveLayout.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * .22
                          : MediaQuery.of(context).size.width * .75,
                      height: MediaQuery.of(context).size.height * .4,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: !ResponsiveLayout.isSmallScreen(context) ? 50 : 10,
                    ),
                    Container(
                      width: !ResponsiveLayout.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * .22
                          : MediaQuery.of(context).size.width * .75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: !ResponsiveLayout.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width * .22
                                : MediaQuery.of(context).size.width * .75,
                            child: Text(
                              'Meet the Owner',
                              textAlign: TextAlign.center,
                              style: bold20,
                            ),
                          ),
                          SizedBox(
                            height: !ResponsiveLayout.isSmallScreen(context)
                                ? 100
                                : 10,
                          ),
                          Text(
                            'Raudel Diaz',
                            style: bold20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              aboutRaudel,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

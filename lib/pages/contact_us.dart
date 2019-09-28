import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import '../utils/constants.dart';
import '../utils/fade_route.dart';
import '../utils/responsive_layouts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/nav_bar.dart';

class ContactUs extends StatefulWidget {
  static Route<dynamic> route() {
    return FadeRoute(
      name: '/contact',
      title: 'Contact Us',
      builder: (_) => ContactUs(),
    );
  }

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<bool> _backHome() async {
    return Navigator.pop(context, true);
  }

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
                height: MediaQuery.of(context).size.height * .4,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/contact.JPG',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Contact Us',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: !ResponsiveLayout.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * .4
                    : MediaQuery.of(context).size.height * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              html.window.location.href = 'mailto:$email.com';
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Phone',
                                  style: grey30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  phone,
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(
                                  height:
                                      !ResponsiveLayout.isSmallScreen(context)
                                          ? 0
                                          : 20,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Location',
                                style: grey30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                location,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: !ResponsiveLayout.isSmallScreen(context)
                                    ? 0
                                    : 20,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              html.window.location.href = 'mailto:$email.com';
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'E-Mail',
                                  style: grey30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  email,
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(
                                  height:
                                      !ResponsiveLayout.isSmallScreen(context)
                                          ? 0
                                          : 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

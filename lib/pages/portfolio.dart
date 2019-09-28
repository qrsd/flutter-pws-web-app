import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/fade_route.dart';
import '../utils/responsive_layouts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/nav_bar.dart';
import '../widgets/portfolio_images.dart';

class Portfolio extends StatefulWidget {
  static Route<dynamic> route() {
    return FadeRoute(
      name: '/portfolio',
      title: 'Portfolio',
      builder: (_) => Portfolio(),
    );
  }

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  String imageJson;
  int imageTotal;

  List<Widget> buildList(String imageManifest) {
    if (imageJson != null) {
      var decodedManifest = jsonDecode(imageManifest);
      var list = List<Widget>();
      for (var item in decodedManifest) {
        if (item['fileName'] != '') {
          list.add(PortfolioImages(item['path']));
        }
      }
      return list;
    } else
      return [Text('Loading...')];
  }

  _loadManifest() async {
    String imageManifest =
        await DefaultAssetBundle.of(context).loadString('imageManifest.json');
    setState(() {
      imageJson = imageManifest;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadManifest();
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: !ResponsiveLayout.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width * .7
                    : MediaQuery.of(context).size.width * .9,
                child: Text(
                  'Portfolio',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: !ResponsiveLayout.isSmallScreen(context)
                      ? MediaQuery.of(context).size.width * .7
                      : MediaQuery.of(context).size.width * .9,
                  child: GridView.count(
                    crossAxisCount:
                        !ResponsiveLayout.isSmallScreen(context) ? 6 : 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: buildList(imageJson),
                  ),
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

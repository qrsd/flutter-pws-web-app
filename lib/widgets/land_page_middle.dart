import 'package:flutter/material.dart';
import 'dart:convert';

import '../utils/constants.dart';
import '../widgets/recent_work.dart';

class MiddleSection extends StatefulWidget {
  @override
  _MiddleSectionState createState() => _MiddleSectionState();
}

class _MiddleSectionState extends State<MiddleSection> {
  String test;

  List<Widget> buildList(String imageManifest) {
    if (test != null) {
      var decodedManifest = jsonDecode(imageManifest).reversed;
      var list = List<Widget>();
      int count = 0;
      for (var item in decodedManifest) {
        if (count == 5) {
          break;
        } else if (item['fileName'] != '') {
          list.add(RecentWork(item['path']));
          count++;
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
      test = imageManifest;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //top height
          SizedBox(
            height: 60,
          ),
          Text(
            introMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                letterSpacing: 2,
                fontFamily: 'Roboto'),
          ),
          Text(
            introMessage2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 1,
            child: Center(
              child: Container(
                width: 250,
                color: Colors.black,
              ),
            ),
          ),
          //Middle height
          SizedBox(
            height: 60,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome to PWS General Construction',
                      style: bold20,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      width: 500,
                      child: Text(
                        welcomeMessage,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                if (MediaQuery.of(context).size.width >= 1250)
                  SizedBox(
                    width: 250,
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Recent Work',
                      style: bold20,
                    ),
                    Container(
                      width: 500,
                      height: 150,
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        children: buildList(test),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Bottom height
          SizedBox(
            height: 62,
          ),
        ],
      ),
    );
  }
}

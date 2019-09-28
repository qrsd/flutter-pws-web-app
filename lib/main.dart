import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/contact_us.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';

void main() => runApp(
      MaterialApp(
        title: 'landing page',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return Home.route();
            case '/portfolio':
              return Portfolio.route();
            case '/about':
              return About.route();
            case '/contact':
              return ContactUs.route();
            default:
              return Home.route();
          }
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        initialRoute: '/',
      ),
    );

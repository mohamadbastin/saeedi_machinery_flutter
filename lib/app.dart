import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saeedi_machinery/pages/home/home.dart';
import 'package:saeedi_machinery/pages/featured/featured.dart';
import 'package:saeedi_machinery/pages/about/about.dart';
import 'package:saeedi_machinery/pages/main.dart';
import 'package:saeedi_machinery/pages/profile/profile.dart';
import 'style.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    theme: ThemeData(

        primaryColor: MyWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        textTheme: TextTheme(
           headline1: MedWhiteLightText,
        ),

      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );

  }
}


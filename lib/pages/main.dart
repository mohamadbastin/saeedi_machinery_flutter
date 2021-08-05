import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saeedi_machinery/components/bottom_nav.dart';
import 'package:saeedi_machinery/models/product.dart';
import 'package:saeedi_machinery/pages/home/home.dart';
import 'package:saeedi_machinery/pages/featured/featured.dart';
import 'package:saeedi_machinery/pages/about/about.dart';
import 'package:saeedi_machinery/pages/profile/profile.dart';
import 'package:saeedi_machinery/style.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget changePage(int pageNo, int state) {
    switch (pageNo) {
      case 0:
        return new Home(state);

      case 1:
        return new Featured();

      case 2:
        return new About();

      case 3: 
        return new Profile();

      //Home Category
      case 4:
        return new Home(state);
    }
  }

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: changePage(_selectedItem, 0),
      bottomNavigationBar: NavBar(
        icons: [
          "assets/icons/search_enable.svg",
          "assets/icons/featured_enable.svg",
          "assets/icons/about_enable.svg",
          "assets/icons/profile_enable.svg",
        ],
        disableIcons: [
          "assets/icons/search_disable.svg",
          "assets/icons/featured_disable.svg",
          "assets/icons/about_disable.svg",
          "assets/icons/profile_disable.svg",
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saeedi_machinery/components/category_card.dart';
import 'package:saeedi_machinery/models/category.dart';
import 'package:saeedi_machinery/pages/about/about.dart';
import 'package:saeedi_machinery/pages/home/home_categories.dart';
import 'package:saeedi_machinery/pages/home/home_products.dart';
import 'package:saeedi_machinery/style.dart';


class Home extends StatefulWidget {

  final int homeState;

  Home(this.homeState);

  @override
  _HomeState createState() => _HomeState();

  changeState(int x){

    _HomeState().setState(() {
      _HomeState()._selectedItem = x;
    });

  }

}

class _HomeState extends State<Home> {

  int _selectedItem = 0 ;
  int _catId = -1;

  @override
  void initState(){
    super.initState();
    _selectedItem = widget.homeState;
  }

  Widget changePage(int pageNo){

    switch (pageNo){

      case 0 : return HomeCategory((index, cat){
        setState(() {
          _selectedItem = index;
          _catId = cat;
        });
      });

      case 1 : return HomeProducts((index){

        setState(() {
          _selectedItem = index;
        });

      }, _catId);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: changePage(_selectedItem),
    );
  }


}
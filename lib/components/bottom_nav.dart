import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saeedi_machinery/pages/home/home.dart';
import 'package:saeedi_machinery/pages/featured/featured.dart';
import 'package:saeedi_machinery/pages/about/about.dart';
import 'package:saeedi_machinery/pages/profile/profile.dart';

class NavBar extends StatefulWidget {

  final int defaultIndex;
  final Function (int) onChange;
  final List<String> icons;
  final List<String> disableIcons;

  NavBar({this.defaultIndex = 0, @required this.icons, @required this.onChange,@required this.disableIcons});

  @override
  _NavBarState createState() => _NavBarState();

}

class _NavBarState extends State<NavBar> {

  int _selectedIndex = 0;
  List<String> _iconList = [];
  List<String> _disableIconList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultIndex;
    _iconList = widget.icons;
    _disableIconList = widget.disableIcons;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++){

      _navBarItemList.add(buildNavBarItem(_iconList[i], _disableIconList[i], i));

    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(String iconEnable,String iconDisable, int index){
    return GestureDetector(
      onTap: (){
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        height: 80,
        width: MediaQuery.of(context).size.width/_iconList.length,

        child: SvgPicture.asset
          ( _selectedIndex == index ? _iconList[index] : _disableIconList[index],
        ),
      ),
    );

  }

}
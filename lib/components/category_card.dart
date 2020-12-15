import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeedi_machinery/style.dart';


class CategoryCard extends StatelessWidget {

  final String _name;
  final int _id;
  final String _imagePath;


  CategoryCard(this._name, this._id, this._imagePath);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      child: Container(

        margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ClipRRect(

              borderRadius: BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(2)),
              child: Container(
                height: 60,
                color: MySemiLightGray,
                child: Image.asset(_imagePath),
              )


            ),

            ClipRRect(

              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(2), bottomRight: Radius.circular(2)),
              child: Container (
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  color: Colors.orange,
                  child: Text(_name, style: TextStyle(fontWeight: FontWeight.w300, fontFamily: FontNameDefault, fontSize: 14, color: MyWhite,), ),
                )
            ),

          ],


        ),
      )
    );
  }
}
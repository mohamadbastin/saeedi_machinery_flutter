import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeedi_machinery/style.dart';


class ProductCard extends StatelessWidget {

  final int _id;
  final String _brand, _model, _year, _assetType;
  final String _imagePath;

  ProductCard(this._id, this._brand, this._model, this._year, this._assetType,
      this._imagePath);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

        child: Container(
          height: 128,
          margin: EdgeInsets.fromLTRB(18, 14, 18, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              ClipRRect(

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
                  child: Container(
                    width: 140,
                    color: MySemiLightGray,
                    child: FadeInImage.assetNetwork(
                      image: _imagePath,
                      placeholder: "assets/images/pholder.jpg", // your assets image path
                      fit: BoxFit.cover,
                    ),
                  )


              ),

              Expanded(

                child: Container (
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(2), bottomRight: Radius.circular(2)),
                      color: MyWhite,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 12, 14, 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Text(_brand, style: TextStyle(fontWeight: FontWeight.w300, fontFamily: FontNameDefault, fontSize: 14, color: MyDarkGray,),)),
                      Expanded(child: Text(_model+"  "+_year, style: TextStyle(fontWeight: FontWeight.w300, fontFamily: FontNameDefault, fontSize: 14 ,color: MyDarkGray,),)),
                      Expanded(child: Text(_assetType, style: TextStyle(fontWeight: FontWeight.w300, fontFamily: FontNameDefault, fontSize: 14, color: MyDarkGray,)),),
                    ],

                  ),

                )
              ),

            ],


          ),
        )
    );

  }


}
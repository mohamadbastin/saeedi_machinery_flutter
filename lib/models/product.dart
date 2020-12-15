
import 'package:flutter/cupertino.dart';

class Product {

  int id;
  String brand, model, year, assetType, condition, serialNo, price, country;
  List imgs;


  Product(id, List attr, List imgs){

    this.id = id;
    this.imgs = imgs;
    this.brand = "";
    this.model = "";
    this.year = "";
    this.assetType = "";
    this.condition = "Good";
    this.country = "N/A";
    this.serialNo = "";
    this.price = "Contact us";

    for (int i = 0; i < attr.length; i++){

      if ( attr[i]['id'] == 3 ){
        this.brand = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 2 ){
        this.model = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 5 ){
        this.year = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 11 ){
        this.assetType = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 15 ){
        this.condition = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 12 ){
        this.serialNo = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 14 ){
        this.price = attr[i]['options'][0];
      }
      else if ( attr[i]['id'] == 1 ){
        this.country = attr[i]['options'][0];
      }

    }

  }

}
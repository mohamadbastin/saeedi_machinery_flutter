
import 'package:flutter/cupertino.dart';

class Category {

  String name;
  int id;
  String imagePath;
  Category(this.name, this.id, this.imagePath);

  static List<Category> fetchAll(){
    return [
      Category("Concrete Equipment", 69, "assets/images/ic_conc.png"),
      Category("Cranes", 70, "assets/images/ic_crane.png"),
      Category("Dozers", 66, "assets/images/ic_dozer.png"),
      Category("Dump Trucks", 74, "assets/images/ic_dump_trucks.png"),
      Category("Excavators", 63, "assets/images/ic_exc.png"),
      Category("Forklifts", 76, "assets/images/ic_folk.png"),
      Category("Rollers", 71, "assets/images/ic_roller.png"),
      Category("Motor Graders", 67, "assets/images/ic_grad.png"),
      Category("Tractors", 45, "assets/images/ic_ldr.png"),
      Category("Wheel Loaders", 64, "assets/images/ic_ldr.png"),
    ];

  }

  static String getCategoryName(int catId){
    List cat = fetchAll();
    for(int i = 0; i< cat.length ; i++) {
      if (cat[i].id == catId){
        return cat[i].name;
      }
    }
    return "";
  }


}
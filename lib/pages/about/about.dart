import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style.dart';

class About extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Container(
        color: MyLightGray,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(18, 40, 18, 14),
                color: MyBlack,
                height: 100,
                child: Row(
                  children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: 48,
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("About us", style: TextStyle(fontFamily: FontNameDefault, fontSize: 18, color: MyWhite,)),
                      )
                  ),

                  Container(
                    width: 48,
                  )
                  ],
                )
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.topCenter ,
                              height: 36,
                              child: SvgPicture.asset(
                                "assets/icons/buy_sell.svg",
                                width: 36,
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("Buy & Sell Used Heavy Equipments & Machinery",
                                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: MyWhite, fontWeight: FontWeight.w300),
                                    maxLines: 3,
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.topCenter ,
                              height: 36,
                              child: SvgPicture.asset(
                                "assets/icons/world.svg",
                                width: 36,
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("Buy & Sell Used Heavy Equipments & Machinery",
                                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: MyWhite, fontWeight: FontWeight.w300),
                                    maxLines: 3,
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.topCenter ,
                              height: 36,
                              child: SvgPicture.asset(
                                "assets/icons/gear.svg",
                                width: 36,
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("Buy & Sell Used Heavy Equipments & Machinery",
                                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: MyWhite, fontWeight: FontWeight.w300),
                                    maxLines: 3,
                                  ),
                                )
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.topCenter ,
                              height: 36,
                              child: SvgPicture.asset(
                                "assets/icons/chat.svg",
                                width: 36,
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("Buy & Sell Used Heavy Equipments & Machinery",
                                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: MyWhite, fontWeight: FontWeight.w300),
                                    maxLines: 3,
                                  ),
                                )
                            )
                          ],
                        ),
                      ),

                    ],
                  ),

                ),
              )
            ]
        )
    );

  }

}
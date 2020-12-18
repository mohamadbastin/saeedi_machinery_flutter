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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding:EdgeInsets.only(top: 4)  ,
                              alignment: Alignment.topCenter ,
                              height: 32,
                              child: SvgPicture.asset(
                                "assets/icons/buy_sell.svg",
                                width: 32,
                                height: 32,
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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding:EdgeInsets.only(top: 4) ,
                              alignment: Alignment.topCenter ,
                              height: 32,
                              child: SvgPicture.asset(
                                "assets/icons/world.svg",
                                width: 32,
                                height: 32,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("Widest Range Of Machinery From Gulf",
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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding:EdgeInsets.only(top: 4) ,
                              alignment: Alignment.topCenter ,
                              height: 32,
                              child: SvgPicture.asset(
                                "assets/icons/gear.svg",
                                width: 32,
                                height: 32,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("List Your Equipments For Free On Our Website & Application",
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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: MyDarkOrange,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 10) ,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding:EdgeInsets.only(top: 4) ,
                              alignment: Alignment.topCenter ,
                              height: 32,
                              child: SvgPicture.asset(
                                "assets/icons/chat.svg",
                                width: 32,
                                height: 32,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                  child: Text("Can\'t Find The Machine?\nEmail Us & We Will Find It For You",
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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: MyWhite,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 14, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter ,
                                    height: 32,
                                    child: SvgPicture.asset(
                                      "assets/icons/location.svg",
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(12, 0, 10, 0) ,
                                        child: Text("Dubai, UAE\nOffice #1102, Floor 11\nSaheel 2 Building\nAfter Al Mulla Plaza towards Sharjah\nP.O. Box. 20863",
                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: MyBlack, fontWeight: FontWeight.w300),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(top: 4) ,
                                    alignment: Alignment.topCenter ,
                                    height: 32,
                                    child: SvgPicture.asset(
                                      "assets/icons/gmail.svg",
                                      width: 28,
                                      height: 28,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(12, 8, 10, 0) ,
                                        child: Text("info@saeedimachinery.com",
                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: MyBlack, fontWeight: FontWeight.w300),
                                          maxLines: 3,
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(top: 4) ,
                                    alignment: Alignment.topCenter ,
                                    height: 32,
                                    child: SvgPicture.asset(
                                      "assets/icons/whatsapp.svg",
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(12, 8, 10, 0) ,
                                        child: Text("+971-502040775",
                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: MyBlack, fontWeight: FontWeight.w300),
                                          maxLines: 3,
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 14),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(top: 4) ,
                                    alignment: Alignment.topCenter ,
                                    height: 32,
                                    child: SvgPicture.asset(
                                      "assets/icons/call.svg",
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(12, 8, 10, 0) ,
                                        child: Text("+971-45667086",
                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: MyBlack, fontWeight: FontWeight.w300),
                                          maxLines: 3,
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),

                ),
              )
            ]
        )
    );

  }

}
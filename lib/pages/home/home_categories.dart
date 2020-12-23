import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saeedi_machinery/components/category_card.dart';
import 'package:saeedi_machinery/models/category.dart';
import 'package:saeedi_machinery/style.dart';

class HomeCategory extends StatelessWidget{

  final Function (int, int) onItemTap;


  HomeCategory(this.onItemTap);

  @override
  Widget build(BuildContext context) {

    final categories = Category.fetchAll();

    var size = MediaQuery.of(context).size;
    final double itemHeight = 112;
    final double itemWidth = (size.width-24) / 2;

    return Container(
        color: MyLightGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              padding: EdgeInsets.fromLTRB(18, 40, 18, 12),
              color: MyBlack,
              height: 100,
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/icons/logo_white.svg"),

            ),

            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 14, 8),
              decoration: new BoxDecoration(
                  color: MyWhite,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(4.0))
              ),
              margin: EdgeInsets.fromLTRB(18, 14, 18, 18),
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (val){
                  SearchKeyWord = val;
                  this.onItemTap(1, -8);
                },
                cursorColor: MySemiLightGray,
                decoration: InputDecoration(
                  hintText: 'Search Keyword',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: MyGray, fontWeight: FontWeight.w300),
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/search_disable.svg",
                    width: 32,
                    height: 18,
                    fit: BoxFit.none,
                    allowDrawingOutsideViewBox: true,
                    matchTextDirection: true,),
                  border: InputBorder.none,
                ),
              ),
            ),

            Expanded(
                child: SingleChildScrollView(

                  child: Column(

                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(18, 0, 0, 8),
                        child: Text("Categories", style: TextStyle(fontFamily: FontNameDefault, fontSize: 16, color: MyDarkGray,)),
                      ),

                      GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2,
                          children:
                          categories.map((category) => GestureDetector(
                              onTap: (){
                                this.onItemTap(1, category.id);
                              },
                              child: CategoryCard(category.name, category.id, category.imagePath )),
                          ).toList()
                      ),

                      GestureDetector(
                        onTap: (){
                          this.onItemTap(1, -10);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: MyDarkOrange,
                          ),
                          margin: EdgeInsets.fromLTRB(18, 14, 18, 24),
                          height: 60 ,
                          alignment: Alignment.center,
                          child: Text("View All", style: TextStyle(fontFamily: FontNameDefault, fontSize: 16, color: MyWhite)),
                        ),
                      )

                    ],
                  ),

            )),




          ],
        )
    );
  }



}
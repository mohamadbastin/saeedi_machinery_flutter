import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saeedi_machinery/components/category_card.dart';
import 'package:saeedi_machinery/components/products_card.dart';
import 'package:saeedi_machinery/models/category.dart';
import 'package:saeedi_machinery/models/product.dart';
import 'package:saeedi_machinery/style.dart';

class HomeProducts extends StatefulWidget{

  final Function (int) onItemTap;
  final int categoryId;


  HomeProducts(this.onItemTap, this.categoryId);

  @override
  _HomeProductsState createState() => _HomeProductsState();

}



class _HomeProductsState extends State<HomeProducts> {
  Future<List> products;


  @override
  void initState() {
    products = getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = 112;
    final double itemWidth = (size.width-24) / 2;

    getProducts();

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
                    child: IconButton(
                      icon: Icon(Icons.keyboard_backspace_sharp, color: MySemiLightGray, size: 28,),
                      onPressed: () {
                        this.widget.onItemTap(0);
                      },
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text((widget.categoryId == -10) ? "Products" : Category.getCategoryName(widget.categoryId ) , style: TextStyle(fontFamily: FontNameDefault, fontSize: 18, color: MyWhite,)),
                      )
                  ),

                  Container(
                    width: 48,
                  )

                ],
              )

          ),
          Expanded(
            child: FutureBuilder<List>(

              future: products,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                if(snapshot.hasData){
                  List<Product> p = [];
                  for (int i = 0; i < snapshot.data.length; i++){
                    p.add(new Product(snapshot.data[i]['id'], snapshot.data[i]['attributes'], snapshot.data[i]['images']));
                  }
                  return ListView(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 18),
                      children: p.map((product) => GestureDetector(
                          onTap: (){},
                          child: ProductCard(0,product.brand, product.model, product.year, product.assetType, product.imgs[0]['src'] )
                      ),
                      ).toList()
                  );
                }
                else {
                      return Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyOrange),),
                            width: 60,
                            height: 60,
                          ),
                        ],
                        ),
                      );
                }
              },

            ) )
        ],

      ),
    );
  }






  Future<List> getProducts() async {

    List products;
    var url = "https://www.saeedimachinery.com//wp-json/wc/v3/products";
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Basic Y2tfNjI1MjU4NjJjOGZlNzg2ZWY3NTFmMzBlMzE1NjRmMmNkMjc3YjQzZTpjc18xNGE0YTBlYjU4MmRhNTZlZTg2ZjIwYjljZTRlMWJmNTUzMjdlYzA1";
    Response response;
    if (widget.categoryId == -10 ){
      response = await dio.get(url, queryParameters: {"per_page" : "100"});
    }
    else{
      response = await dio.get(url, queryParameters: {"category": widget.categoryId, "per_page" : "100"});
    }

    return response.data;

  }

}
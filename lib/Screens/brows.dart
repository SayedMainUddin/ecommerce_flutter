import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Models/category_model.dart';
import 'package:ecommerce_flutter/Models/product.dart';
import 'package:ecommerce_flutter/Models/store_model.dart';
import 'package:ecommerce_flutter/Screens/product_detail.dart';
import 'package:ecommerce_flutter/Store/AddProduct.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/myCart.dart';
import 'package:ecommerce_flutter/utils/favourite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/utils/group_list_view.dart';
import 'package:ecommerce_flutter/utils/app_color.dart';
import 'package:ecommerce_flutter/utils/listview.dart';

class BrowsPage extends StatefulWidget {
/*  final categoryName;
  BrowsPage({
    this.categoryName,
  });*/
  @override
  _BrowsPage createState() => _BrowsPage();
}

class _BrowsPage extends State<BrowsPage> {
  _appBar(height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+160 ),
    child: Stack(
      children: <Widget>[

        Column(
          children: [

            Container(
              padding: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height*.30,
              color: Color(0xF80687F6),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Browse',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          FavoriteButton(
                            // iconSize: 20,
                            isFavorite: true,
                            // iconDisabledColor: Colors.white,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite : $_isFavorite');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart,color: Colors.white),
                            onPressed: () {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MyCartPage(productName: LocalStorage.productName,productImage: LocalStorage.productImage,)));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 14.0, left: 8.0, right: 8.0,bottom: 10),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 5.0),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 0.0,
                                    borderRadius:
                                    BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.black87,
                                      width: 1.0,
                                    ),
                                  ),
                                  hintText: 'Search Product',
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    gapPadding: 0.0,
                                    borderRadius:
                                    BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.black87,
                                      width: 1.0,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.search,color: Color(0xF80687F6),),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                    left: 15.0,
                                    top: 0.0,
                                    bottom: 0.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color:Color(0xF80687F6),
                    padding:EdgeInsets.only(left: 10,right: 10,top: 1,bottom: 1) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(

                            icon: const Icon(
                              Icons.sort,
                              color: Colors.white,
                            ),
                            onPressed: onPressed,
                            label: Text(
                              "Sort by",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xF80687F6)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            )
                        ),

                        ElevatedButton.icon(

                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            onPressed: onPressed,
                            label: Text(
                              "Location",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xF80687F6)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            )
                        ),

                        ElevatedButton.icon(

                            icon: const Icon(
                              Icons.view_comfortable,
                              color: Colors.white,
                            ),
                            onPressed: onPressed,
                            label: Text(
                              "Category",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xF80687F6)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),


          ],
        )

      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: _appBar(AppBar().preferredSize.height),
        body: SingleChildScrollView(
          child:
          Container(

            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 2),
              children: List.generate(categories.length, (index) {
                return Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.60,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Click products');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Products(
                                  imageUrl:  categories[index].imageUrl,
                                )));
                      },
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height*0.13,
                                width: MediaQuery.of(context).size.width*0.45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                                      image: AssetImage(
                                        categories[index].imageUrl,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),


                            ],
                          ),
                          ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      categories[index].name,
                                      style: TextStyle(fontFamily: 'Montserrat',fontSize: 17,color: Colors.black45,fontWeight: FontWeight.w400,),
                                      overflow: TextOverflow.ellipsis

                                  ),
                                  Text('\$${productList[index].price}',
                                      style: TextStyle(
                                          color: Color(0xF80687F6),
                                          fontWeight:
                                          FontWeight.w900,
                                          fontSize: 14),
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),


                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [     Container(
                                        height: 20,
                                        width: 20,

                                        decoration: BoxDecoration(
                                            color: Color(0xF80687F6),
                                            shape: BoxShape.circle,
                                            border: Border.all()
                                        ),
                                        child:Container(
                                          alignment: Alignment.center,
                                          child:  Text(storeList[index].name.characters.first,style: TextStyle(
                                              fontSize: 15,color: Colors.white,fontWeight: FontWeight.w900
                                          ),
                                          ),
                                        )
                                    ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.33,
                                        child: Text(storeList[index].name,style: TextStyle(
                                            color: Colors.black26,fontSize: 13,fontWeight: FontWeight.w900
                                        ),
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),

                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                );

              }),
            ),
          ),
        ),
      ),
    ), onWillPop: () async{
return false;
    });
  }
  List<Category> categories = [
    Category(id:1,imageUrl:  "assets/Twilio-Chat-Bot.jpg",          select: true,name: "Bot",),
    Category(id:2,imageUrl:  "assets/programingName/chat-app.jpg",  select: true,name: "Chat",),
    Category(id:3,imageUrl:  "assets/programingName/csharp.jpg",    select: true,name: "Csharp",),
    Category(id:4,imageUrl:  "assets/programingName/excel.jpg",     select: true,name: "excel",),
    Category(id:5,imageUrl:  "assets/programingName/flutter.png",   select: true,name: "flutter",),
    Category(id:6,imageUrl:  "assets/programingName/flutterapp.png",select: true,name: "flutterapp",),
    Category(id:7,imageUrl:  "assets/programingName/html.jpg",      select: true,name: "html",),
    Category(id:8,imageUrl:  "assets/programingName/java.jpg",      select: true,name: "java",),
    Category(id:9,imageUrl:  "assets/programingName/javascript.jpg",select: true,name: "javascript",),
    Category(id:10,imageUrl: "assets/programingName/machine.png",   select: true,name: "machine",),
    Category(id:11,imageUrl: "assets/programingName/mongodb.png",   select: true,name: "mongodb",),
    Category(id:12,imageUrl: "assets/programingName/nodejs.png",    select: true,name: "nodejs",),
    Category(id:13,imageUrl: "assets/programingName/php.jpg",       select: true,name: "php",),
    Category(id:14,imageUrl: "assets/programingName/posSystem.jpg", select: true,name: "posSystem",),
    Category(id:15,imageUrl: "assets/programingName/pythonlogo.png",select: true,name: "pythonlogo",),
    Category(id:16,imageUrl: "assets/programingName/reactjs.png",   select: true,name: "reactjs",),

    Category(id:17,imageUrl: "assets/images/allCategories/beverage1.jpeg",select: true,name: "Beverage ",),
    Category(id:18,imageUrl: "assets/images/allCategories/seloon.jpg",select: true,name: "Seloon",),
    Category(id:19,imageUrl: "assets/images/allCategories/shoes_6.png",select: true,name: "Shoes",),
    Category(id:20,imageUrl: "assets/images/allCategories/vagetables.jpg",select: true,name: "Vagetable",),
  ];
  final List<String> imgList_chair = [
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
  ];

  final List<String> imgList_beverage = [
    "assets/images/beverage1.jpeg",
    "assets/images/beverage2.png",
    "assets/images/beverage3.jpg",
    "assets/images/beverage4.jpg",
    "assets/images/beverage5.jpg",
    "assets/images/beverage6.jpg",
    "assets/images/beverage7.jpg",
    "assets/images/beverage8.jpg",
    "assets/images/beverage9.jpg",
    "assets/images/beverage10.jpg",
  ];

  void onPressed() {
  }
}

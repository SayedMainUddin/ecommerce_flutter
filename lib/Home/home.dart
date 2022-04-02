import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/Home/store.dart';
import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Models/Country.dart';
import 'package:ecommerce_flutter/Models/category_model.dart';
import 'package:ecommerce_flutter/Models/listdata.dart';
import 'package:ecommerce_flutter/Profile/store_profile.dart';

import 'package:ecommerce_flutter/Screens/brows.dart';
import 'package:ecommerce_flutter/Screens/wish_list.dart';
import 'package:ecommerce_flutter/allCategory.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/myCart.dart';
import 'package:ecommerce_flutter/product_detail.dart';
import 'package:ecommerce_flutter/widgets/country_widget.dart';
import 'package:ecommerce_flutter/widgets/sub_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/categorise.dart';

import 'package:flutter/rendering.dart';
import 'slider.dart';
import 'package:ecommerce_flutter/utils/favourite_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    "assets/programingName/botpng.png",
    "assets/programingName/chat-app.jpg",
    "assets/programingName/csharp.jpg",
    "assets/programingName/excel.jpg",
    "assets/programingName/flutter.png",
    "assets/programingName/flutterapp.png",
    "assets/programingName/html.jpg",
    "assets/programingName/java.jpg",
    "assets/programingName/javascript.jpg",
    "assets/programingName/machine.png",
    "assets/programingName/mongodb.png",
    "assets/programingName/nodejs.png",
    "assets/programingName/php.jpg",
    "assets/programingName/posSystem.jpg",
    "assets/programingName/pythonlogo.png",
    "assets/programingName/reactjs.png",
    "assets/images/vagetables.jpg",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair2.png",
    "assets/images/ic_chair.png",
    "assets/images/ic_chair4.png",
    "assets/images/shoes_1.png",
    "assets/images/shoes_2.png",
    "assets/images/shoes_3.png",
    "assets/images/shoes_4.png",
  ];

  List<Category> categories = [
    Category(id:1,imageUrl:  "assets/programingName/botpng.png",    select: true,name: "Somsh",),
    Category(id:2,imageUrl:  "assets/programingName/chat-app.jpg",  select: true,name: "Kenec",),
    Category(id:3,imageUrl:  "assets/programingName/csharp.jpg",    select: true,name: "Testi",),
    Category(id:4,imageUrl:  "assets/programingName/excel.jpg",     select: true,name: "Testi",),
    Category(id:5,imageUrl:  "assets/programingName/flutter.png",   select: true,name: "Bilai",),
    Category(id:6,imageUrl:  "assets/programingName/flutterapp.png",select: true,name: "Helpe",),
    Category(id:7,imageUrl:  "assets/programingName/html.jpg",      select: true,name: "Teste",),
    Category(id:8,imageUrl:  "assets/programingName/java.jpg",      select: true,name: "Teste",),
    Category(id:9,imageUrl:  "assets/programingName/javascript.jpg",select: true,name: "Teste",),
    Category(id:10,imageUrl: "assets/programingName/machine.png",   select: true,name: "Teste",),
    Category(id:11,imageUrl: "assets/programingName/mongodb.png",   select: true,name: "Teste",),
    Category(id:12,imageUrl: "assets/programingName/nodejs.png",    select: true,name: "Teste",),
    Category(id:13,imageUrl: "assets/programingName/php.jpg",       select: true,name: "Teste",),
    Category(id:14,imageUrl: "assets/programingName/posSystem.jpg", select: true,name: "Teste",),
    Category(id:15,imageUrl: "assets/programingName/pythonlogo.png",select: true,name: "Teste",),
    Category(id:16,imageUrl: "assets/programingName/reactjs.png",   select: true,name: "Teste",),

    Category(id:17,imageUrl: "assets/images/allCategories/beverage1.jpeg",select: true,name: "Beverage ",),
    Category(id:18,imageUrl: "assets/images/allCategories/seloon.jpg",select: true,name: "Seloon",),
    Category(id:19,imageUrl: "assets/images/allCategories/shoes_6.png",select: true,name: "Shoes",),
    Category(id:20,imageUrl: "assets/images/allCategories/vagetables.jpg",select: true,name: "Vagetable",),
   ];
  final List<String> imgList2 = [

    "assets/programingName/flutter.png",
    "assets/programingName/flutterapp.png",
    "assets/programingName/html.jpg",
    "assets/programingName/java.jpg",
    "assets/programingName/javascript.jpg",
    "assets/programingName/machine.png",
    "assets/programingName/mongodb.png",
    "assets/programingName/nodejs.png",
    "assets/programingName/php.jpg",
    "assets/programingName/posSystem.jpg",
    "assets/programingName/pythonlogo.png",
    "assets/programingName/reactjs.png",
    "assets/programingName/botpng.png",
    "assets/programingName/chat-app.jpg",
    "assets/programingName/csharp.jpg",
    "assets/programingName/excel.jpg",
    "assets/images/vagetables.jpg",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair2.png",
    "assets/images/ic_chair.png",
    "assets/images/ic_chair4.png",
    "assets/images/shoes_1.png",
    "assets/images/shoes_2.png",
    "assets/images/shoes_3.png",
    "assets/images/shoes_4.png",
  ];
  final List<String> imgList3 = [


    "assets/programingName/javascript.jpg",
    "assets/programingName/machine.png",
    "assets/programingName/mongodb.png",
    "assets/programingName/nodejs.png",
    "assets/programingName/php.jpg",
    "assets/programingName/posSystem.jpg",
    "assets/programingName/pythonlogo.png",
    "assets/programingName/reactjs.png",
    "assets/programingName/botpng.png",
    "assets/programingName/chat-app.jpg",
    "assets/programingName/csharp.jpg",
    "assets/programingName/excel.jpg",
    "assets/programingName/flutter.png",
    "assets/programingName/flutterapp.png",
    "assets/programingName/html.jpg",
    "assets/programingName/java.jpg",
    "assets/images/vagetables.jpg",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair2.png",
    "assets/images/ic_chair.png",
    "assets/images/ic_chair4.png",
    "assets/images/shoes_1.png",
    "assets/images/shoes_2.png",
    "assets/images/shoes_3.png",
    "assets/images/shoes_4.png",
  ];

  List<Category> allCategory=[];
  @override
  void initState() {
    allCategory=categories;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(

            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height*0.20,
                          color: Color(0xFF19818E),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'Groceries',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.favorite,color:Colors.red ),
                                        onPressed: () {

                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>WishListPage()));
                                        },
                                      ),
                                  /*    FavoriteButton(
                                        // iconSize: 20,
                                        isFavorite: true,
                                        // iconDisabledColor: Colors.white,
                                        valueChanged: (_isFavorite) {
                                          print('Is Favorite : $_isFavorite');
                                        },
                                      ),*/
                                      Stack(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.shopping_cart,color: Colors.white,),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => MyCartPage(productName: LocalStorage.productName,productImage: LocalStorage.productImage,)));
                                            },
                                          ),
                                          LocalStorage.orderId==0?Container(): Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 5),
                                      child:     Container(
                                    /*    height: 6,
                                        width: 6,
                                        color: Colors.white,*/
                                        child: Text('1',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                                      ),)
                                        ],
                                      )

                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 14.0, left: 12.0, right: 8.0),
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
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: Color(0xFF19818E),
                                              ),
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
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        MostVisitedCountriesWidget(),
                       InkWell(
                         onTap: ()=>launch('https://www.fiverr.com/sumedhsuhrid/'),
                         child:  Container(
                           child: Padding(
                             padding: EdgeInsets.only(
                                 top: 6.0, left: 0.0, right: 0.0),
                             child: Image(
                               fit: BoxFit.cover,
                             //  image: AssetImage('assets/ezgif.com-gif-maker (2).gif'),
                               image: AssetImage('assets/images/banner-2.png'),
                             ),
                           ),
                         ),
                       ),
                        SubHeaderWidget(
                          header: 'Most visited',
                          onTabSeeAll: () {},
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: MediaQuery.of(context).size.height*0.30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: imgList2.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*0.45,
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
                                                    imageUrl: i,
                                                  )));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.20,
                                                  width: MediaQuery.of(context).size.width*0.45,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                                                        image: AssetImage(
                                                          i,
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),


                                              ],
                                            ),
                                            ListTile(
                                                title:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Fish',
                                                      style: TextStyle(fontFamily: 'Montserrat',fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w400),
                                                    ),
                                                    Text(
                                                      'Sold : 50',
                                                      style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.black45,fontWeight: FontWeight.w400),
                                                    ),
                                                  ],
                                                ),

                                                subtitle: Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [     Container(
                                                            height: MediaQuery.of(context).size.height*0.03,
                                                            width: MediaQuery.of(context).size.height*0.03,

                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF19818E),
                                                                shape: BoxShape.circle,
                                                                border: Border.all()
                                                            ),
                                                            child:Container(
                                                              alignment: Alignment.center,
                                                              child:  Text('T',style: TextStyle(
                                                                  fontSize: 16,color: Colors.white,fontWeight: FontWeight.w900
                                                              ),),
                                                            )
                                                        ),
                                                          SizedBox(width: 3,),
                                                          Container(
                                                            child: Text('Tredy',style: TextStyle(
                                                                color: Colors.black26,fontSize: 16,fontWeight: FontWeight.w900
                                                            ),),
                                                          )
                                                        ],
                                                      ),
                                                      Text('\$200',
                                                          style: TextStyle(
                                                              color: Color(0xFF19818E),
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              fontSize: 20)),
                                                    ],
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SubHeaderWidget(
                          header: 'Shop By Category',
                          onTabSeeAll: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Categorise()));
                          },
                        ),
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            padding: EdgeInsets.only(
                                top: 2, left: 2, right: 2, bottom: 2),
                            children: List.generate(8, (index) {
                              return Container(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      var categoryName=allCategory[index].name;
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_)=>AllFavouriteCategory(categoryName: categoryName,)));

                                      print('Card tapped.');
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                colorFilter: new ColorFilter.mode(
                                                    Colors.black.withOpacity(0.15), BlendMode.darken),

                                                image: AssetImage(
                                                  allCategory[index].imageUrl,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),

                                       IgnorePointer(
                                         child:  Container(
                                           alignment: Alignment.center,
                                           child: Center(
                                             child: Text(
                                               allCategory[index].name,
                                               textAlign: TextAlign.center,
                                               style: TextStyle(
                                                   fontSize: 16.0,
                                                   fontFamily: 'bold',
                                                   fontWeight: FontWeight.bold,


                                                   color: Colors.white),
                                             ),
                                           ),
                                         ),
                                       ),

                                      ],
                                    ),


                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                 InkWell(
                   onTap: ()=>launch('https://www.fiverr.com/sumedhsuhrid/'),
                   child:        Container(
                     child: Padding(
                       padding: EdgeInsets.only(
                           top: 6.0, left: 0.0, right: 0.0, bottom: 10),
                       child: Image(
                         fit: BoxFit.cover,
                        // image: AssetImage('assets/ezgif.com-gif-maker.gif'),
                         image: AssetImage('assets/images/banner-1.png'),
                       ),
                     ),
                   ),
                 ),
                        SubHeaderWidget(
                          header: 'Favourite Items',
                          onTabSeeAll: () {
                            var categoryName = 'All Favourite Items';
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllFavouriteCategory(
                                          categoryName: categoryName,
                                        )));
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: MediaQuery.of(context).size.height*0.30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: imgList.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*0.45,
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
                                                    imageUrl: i,
                                                  )));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.20,
                                                  width: MediaQuery.of(context).size.width*0.45,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                                                        image: AssetImage(
                                                          i,
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),


                                              ],
                                            ),
                                            ListTile(
                                                title:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Fish',
                                                      style: TextStyle(fontFamily: 'Montserrat',fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w400),
                                                    ),
                                                    Text(
                                                      'Sold : 50',
                                                      style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.black45,fontWeight: FontWeight.w400),
                                                    ),
                                                  ],
                                                ),

                                                subtitle: Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [     Container(
                                                            height: MediaQuery.of(context).size.height*0.03,
                                                            width: MediaQuery.of(context).size.height*0.03,

                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF19818E),
                                                                shape: BoxShape.circle,
                                                                border: Border.all()
                                                            ),
                                                            child:Container(
                                                              alignment: Alignment.center,
                                                              child:  Text('T',style: TextStyle(
                                                                  fontSize: 16,color: Colors.white,fontWeight: FontWeight.w900
                                                              ),),
                                                            )
                                                        ),
                                                          SizedBox(width: 3,),
                                                          Container(
                                                            child: Text('Tredy',style: TextStyle(
                                                                color: Colors.black26,fontSize: 16,fontWeight: FontWeight.w900
                                                            ),),
                                                          )
                                                        ],
                                                      ),
                                                      Text('\$200',
                                                          style: TextStyle(
                                                              color: Color(0xFF19818E),
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              fontSize: 20)),
                                                    ],
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SubHeaderWidget(
                          header: 'New Products',
                          onTabSeeAll: () {
                            var categoryName = 'All Favourite Items';
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllFavouriteCategory(
                                      categoryName: categoryName,
                                    )));
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: MediaQuery.of(context).size.height*0.30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: imgList3.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*0.45,
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
                                                    imageUrl: i,
                                                  )));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.20,
                                                  width: MediaQuery.of(context).size.width*0.45,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                                                        image: AssetImage(
                                                          i,
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),


                                              ],
                                            ),
                                            ListTile(
                                              title:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Fish',
                                                    style: TextStyle(fontFamily: 'Montserrat',fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Sold : 50',
                                                    style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.black45,fontWeight: FontWeight.w400),
                                                  ),
                                                ],
                                              ),

                                              subtitle: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [     Container(
                                                          height: MediaQuery.of(context).size.height*0.03,
                                                          width: MediaQuery.of(context).size.height*0.03,

                                                          decoration: BoxDecoration(
                                                              color: Color(0xFF19818E),
                                                              shape: BoxShape.circle,
                                                              border: Border.all()
                                                          ),
                                                          child:Container(
                                                            alignment: Alignment.center,
                                                            child:  Text('T',style: TextStyle(
                                                                fontSize: 16,color: Colors.white,fontWeight: FontWeight.w900
                                                            ),),
                                                          )
                                                      ),
                                                        SizedBox(width: 3,),
                                                        Container(
                                                          child: Text('Tredy',style: TextStyle(
                                                              color: Colors.black26,fontSize: 16,fontWeight: FontWeight.w900
                                                          ),),
                                                        )
                                                      ],
                                                    ),
                                                    Text('\$200',
                                                        style: TextStyle(
                                                            color: Color(0xFF19818E),
                                                            fontWeight:
                                                            FontWeight.w900,
                                                            fontSize: 20)),
                                                  ],
                                                ),
                                              )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                      color: Color(0xFF19818E),
             child:     Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: Text('Store To Follow',style: TextStyle(
                     color: Colors.white,fontSize: 20,fontFamily: 'Montserrat',fontWeight: FontWeight.w500
                   ),),

                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       //  ElevatedButton(onPressed: onPressed, child: Text('Follow'))
                       ElevatedButton(
                         child: Text("View All"),
                         onPressed: () {
                           print("it's pressed follow");


                         } ,
                         style: ElevatedButton.styleFrom(
                           primary: Colors.white,
                           onPrimary: Color(0xFF19818E),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(32.0),
                           ),
                         ),
                       )
                     ],
                   ),
                 )
               ],
             )



                    ),
                        StorePage()
                      ],
                    ),
                  ),

                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              ),
            ]),
      ),
    );
  }
}

class MostVisitedCountriesWidget extends StatefulWidget {
  const MostVisitedCountriesWidget({Key? key}) : super(key: key);

  @override
  State<MostVisitedCountriesWidget> createState() =>
      _MostVisitedCountriesWidgetState();
}

class _MostVisitedCountriesWidgetState
    extends State<MostVisitedCountriesWidget> {
  void onCountryFavChanged(int index) {
    countryList[index].isMyFavourite = !countryList[index].isMyFavourite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: countryList.length,
            itemBuilder: (context, index) {
              final Country country = countryList[index];
              final Widget countryWidget = SizedBox(
                width: 300.0,
                child: CountryWidget(
                  country: country,
                  onFavChanged: () => onCountryFavChanged(index),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CountryPage(
                        country: country,
                        destinies: destinyList
                            .where((element) => element.countryID == country.id)
                            .toList(),
                      ),
                    ),
                  ),
                ),
              );

              if (index < countryList.length - 1) {
                return Row(
                  children: [
                    countryWidget,
                    const SizedBox(width: 16.0),
                  ],
                );
              }
              return countryWidget;
            },
          ),
        )
      ],
    );
  }
}

class Country {
  final String id;
  final String name;
  final String imageURL;
  final int attraction;
  bool isMyFavourite;

  Country({
    required this.id,
    required this.name,
    required this.attraction,
    required this.imageURL,
    this.isMyFavourite = false,
  });
}

class Destiny {
  final String countryID;
  final String destiny;
  final String imageURL;
  final String? illustration;

  const Destiny({
    required this.countryID,
    required this.destiny,
    required this.imageURL,
    this.illustration,
  });
}

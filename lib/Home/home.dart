import 'dart:ui';
import 'package:ecommerce_flutter/Models/product.dart';
import 'package:ecommerce_flutter/Models/store_model.dart';
import 'package:ecommerce_flutter/Screens/favourites_items.dart';
import 'package:ecommerce_flutter/Screens/all_stores_screen.dart';
import 'package:ecommerce_flutter/Screens/categorise.dart';
import 'package:ecommerce_flutter/Screens/product_detail.dart';
import 'package:ecommerce_flutter/Store/AddProduct.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/Home/store.dart';
import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Models/category_model.dart';
import 'package:ecommerce_flutter/Profile/store_profile.dart';
import 'package:ecommerce_flutter/Screens/brows.dart';
import 'package:ecommerce_flutter/Screens/wish_list.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/myCart.dart';
import 'package:ecommerce_flutter/widgets/sub_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'slider.dart';
import 'package:ecommerce_flutter/utils/favourite_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  bool isSearchBarShow = false;
  bool searchValue = false;
  List<Category> categories = [
    Category(id:1,imageUrl:  "assets/Boss-Fiverr-Wallpaper.jpg",          select: true,name: "Bot",),
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
 // List<Category> allCategory=[];
  List<Category> foundResult = [];
  @override
  void initState() {
  //  allCategory=categories;
    foundResult=categories;
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
                                      'Alchemy',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
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
                                                color: Color(0xF80687F6),
                                              ),
                                              filled: true,
                                              contentPadding: EdgeInsets.only(
                                                left: 15.0,
                                                top: 0.0,
                                                bottom: 0.0,
                                              ),
                                            ),
                                            controller: searchController,
                                            onChanged: (value) => _runFilter(value),
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
                        SizedBox(height: 5),
                      // MostVisitedCountriesWidget(),
                        Container(
                          padding: EdgeInsets.all(2),
                          //margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: MediaQuery.of(context).size.height*0.25,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: categories.map((index) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*0.80,
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
                                                    imageUrl:index.imageUrl,
                                                  )));
                                        },
                                        child:  Container(
                                          height: MediaQuery.of(context).size.height*0.22,
                                          width: MediaQuery.of(context).size.width*0.80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                                                image: AssetImage(
                                                  index.imageUrl,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),

                    /*    searchValue==true?
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              print(1);
                              return InkWell(
                                child: index == 0
                                    ? Column(
                                  children: [
                                    MarkToken(
                                      categories: foundResult[index],
                                    )
                                  ],
                                )
                                    : MarkToken(
                                  categories: foundResult[index],
                                ),
                                onTap: () {
                                  setState(() {
                                    if (foundResult[index].select == true) {
                                      foundResult[index].select = false;
                                    } else {
                                      foundResult[index].select = true;
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        ),*/
                       InkWell(
                         onTap: ()=>launch('https://www.fiverr.com/sumedhsuhrid/'),
                         child:  Container(
                           child: Padding(
                             padding: EdgeInsets.only(
                                 top: 6.0, left: 0.0, right: 0.0),
                             child: Image(
                               fit: BoxFit.cover,
                               image: AssetImage('assets/ezgif.com-gif-maker (2).gif'),
                             ),
                           ),
                         ),
                       ),
                        SubHeaderWidget(
                          header: 'Most visited',
                          onTabSeeAll: () {},
                        ),
                        SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              height: MediaQuery.of(context).size.height*0.30,

                              child:       ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(categories.length, (index){
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
                                                      height: MediaQuery.of(context).size.height*0.20,
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
                                                    title:
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(

                                                          child:   Text(
                                                              categories[index].name,
                                                              style: TextStyle(fontFamily: 'Montserrat',fontSize: 16,color: Colors.black45,
                                                                  fontWeight: FontWeight.w400),
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                        ),
                                                        Container(

                                                          child:    Text(
                                                            'Sold : ${productList[index].sold}',
                                                            style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.black45,fontWeight: FontWeight.w400),
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    subtitle: Padding(
                                                      padding: EdgeInsets.only(top: 7),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [     Container(
                                                                height: MediaQuery.of(context).size.height*0.03,
                                                                width: MediaQuery.of(context).size.width*0.05,

                                                                decoration: BoxDecoration(
                                                                    color: Color(0xF80687F6),
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all()
                                                                ),
                                                                child:Container(
                                                                  alignment: Alignment.center,
                                                                  child:  Text(storeList[index].name.characters.first,style: TextStyle(
                                                                      fontSize: 14,color: Colors.white,fontWeight: FontWeight.w900
                                                                  ),),
                                                                )
                                                            ),

                                                              Container(
                                                                height: MediaQuery.of(context).size.height*0.02,
                                                                width: MediaQuery.of(context).size.width*0.16,
                                                                child: Text(storeList[index].name,style: TextStyle(
                                                                    color: Colors.black26,fontSize: 14,fontWeight: FontWeight.w900
                                                                ),overflow: TextOverflow.ellipsis),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            height: MediaQuery.of(context).size.height*0.02,
                                                            width: MediaQuery.of(context).size.width*0.12,
                                                            child: Text('\$${productList[index].price}',style: TextStyle(
                                                                color: Color(0xF80687F6),fontSize: 13,fontWeight: FontWeight.w900
                                                            ),overflow: TextOverflow.ellipsis),
                                                          )
                                                          /*        Text('\$${productList[index].Price}',
                                                          style: TextStyle(
                                                              color: Color(0xF80687F6),
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              fontSize: 13)),*/
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
                              ),         )

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
                                      var categoryName=categories[index].name;
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
                                                  categories[index].imageUrl,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),

                                       IgnorePointer(
                                         child:  Container(
                                           alignment: Alignment.center,
                                           child: Center(
                                             child: Text(
                                               categories[index].name,
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
                         image: AssetImage('assets/ezgif.com-gif-maker.gif'),
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
                        SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              height: MediaQuery.of(context).size.height*0.30,

                              child:       ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(categories.length, (index){
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
                                                      height: MediaQuery.of(context).size.height*0.20,
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
                                                    title:
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(

                                                          child:   Text(
                                                              categories[index].name,
                                                              style: TextStyle(fontFamily: 'Montserrat',fontSize: 16,color: Colors.black45,
                                                                  fontWeight: FontWeight.w400),
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                        ),
                                                        Container(

                                                          child:    Text(
                                                            'Sold : ${'5'}',
                                                            style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.black45,fontWeight: FontWeight.w400),
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    subtitle: Padding(
                                                      padding: EdgeInsets.only(top: 7),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [     Container(
                                                                height: MediaQuery.of(context).size.height*0.03,
                                                                width: MediaQuery.of(context).size.width*0.05,

                                                                decoration: BoxDecoration(
                                                                    color: Color(0xF80687F6),
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all()
                                                                ),
                                                                child:Container(
                                                                  alignment: Alignment.center,
                                                                  child:  Text(storeList[index].name.characters.first,style: TextStyle(
                                                                      fontSize: 14,color: Colors.white,fontWeight: FontWeight.w900
                                                                  ),),
                                                                )
                                                            ),

                                                              Container(
                                                                height: MediaQuery.of(context).size.height*0.02,
                                                                width: MediaQuery.of(context).size.width*0.16,
                                                                child: Text(storeList[index].name,style: TextStyle(
                                                                    color: Colors.black26,fontSize: 14,fontWeight: FontWeight.w900
                                                                ),overflow: TextOverflow.ellipsis),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            height: MediaQuery.of(context).size.height*0.02,
                                                            width: MediaQuery.of(context).size.width*0.12,
                                                            child: Text('\$${productList[index].price}',style: TextStyle(
                                                                color: Color(0xF80687F6),fontSize: 13,fontWeight: FontWeight.w900
                                                            ),overflow: TextOverflow.ellipsis),
                                                          )
                                                          /*        Text('\$${productList[index].Price}',
                                                          style: TextStyle(
                                                              color: Color(0xF80687F6),
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              fontSize: 13)),*/
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
                              ),         )

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
                        SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              height: MediaQuery.of(context).size.height*0.30,

                              child:       ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(categories.length, (index){
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
                                                      height: MediaQuery.of(context).size.height*0.20,
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
                                                    title:
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(

                                                          child:   Text(
                                                             categories[index].name,
                                                              style: TextStyle(fontFamily: 'Montserrat',fontSize: 16,color: Colors.black45,
                                                                  fontWeight: FontWeight.w400),
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                        ),
                                                        Container(

                                                          child:    Text(
                                                            'Sold : ${'5'}',
                                                            style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.black45,fontWeight: FontWeight.w400),
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    subtitle: Padding(
                                                      padding: EdgeInsets.only(top: 7),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [     Container(
                                                                height: MediaQuery.of(context).size.height*0.03,
                                                                width: MediaQuery.of(context).size.width*0.05,

                                                                decoration: BoxDecoration(
                                                                    color: Color(0xF80687F6),
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all()
                                                                ),
                                                                child:Container(
                                                                  alignment: Alignment.center,
                                                                  child:  Text(storeList[index].name.characters.first,style: TextStyle(
                                                                      fontSize: 14,color: Colors.white,fontWeight: FontWeight.w900
                                                                  ),),
                                                                )
                                                            ),

                                                              Container(
                                                                height: MediaQuery.of(context).size.height*0.02,
                                                                width: MediaQuery.of(context).size.width*0.16,
                                                                child: Text(storeList[index].name,style: TextStyle(
                                                                    color: Colors.black26,fontSize: 14,fontWeight: FontWeight.w900
                                                                ),overflow: TextOverflow.ellipsis),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            height: MediaQuery.of(context).size.height*0.02,
                                                            width: MediaQuery.of(context).size.width*0.12,
                                                            child: Text('\$${productList[index].price}',style: TextStyle(
                                                                color: Color(0xF80687F6),fontSize: 13,fontWeight: FontWeight.w900
                                                            ),overflow: TextOverflow.ellipsis),
                                                          )
                                                          /*        Text('\$${productList[index].Price}',
                                                          style: TextStyle(
                                                              color: Color(0xF80687F6),
                                                              fontWeight:
                                                              FontWeight.w900,
                                                              fontSize: 13)),*/
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
                              ),         )

                        ),
                        Container(
                      color: Color(0xF80687F6),
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

                        Navigator.push(context, MaterialPageRoute(builder: (_)=>AllStoresPage()));
                         } ,
                         style: ElevatedButton.styleFrom(
                           primary: Colors.white,
                           onPrimary: Color(0xF80687F6),
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
            ])
      ),
    );
  }
  void _runFilter(String enteredKeyword) {
    List<Category> results = [];
    print(searchController.text);

/*    setState(() {
      if (searchController.text == '') {
        searchValue = true;
      }
    });*/
    setState(() {
      searchValue = true;
    });
    print(searchValue);
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = categories;
    } else {
      //MarkToken();
      results = categories
          .where((user) =>
          user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundResult = results;
    });
  }

}

class MarkToken extends StatefulWidget {
  final Category? categories;

  const MarkToken({Key? key, this.categories}) : super(key: key);

  @override
  _MarkTokenState createState() => _MarkTokenState();
}

class _MarkTokenState extends State<MarkToken> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 300,
        child: Card(
          child: Column(
            children: [
              Card(
                color: Color(0xFFFF2651),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                    /*        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ExamInformationPage()));*/
                          },
                          child: Card(
                            color:Color(0xFFFF2651),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: 250,
                              child: Container(
                                color: Color(0xFFFF2651),
                                child: Text(
                                  'CET.7.20222019.Chemestry:104',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                    Card(
                      color: Color(0xFFFF2651),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: 150,
                                child: Container(
                                  child: Card(
                                    color: Color(0xFFFF2651),
                                    child: Text(
                                      'Enrollment :',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: 160,
                                child: Container(
                                  child: Card(
                                    color: Color(0xFFFF2651),
                                    child: Text(
                                      '19.02.2022',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: 150,
                                child: Container(
                                  child: Card(
                                    color: Color(0xFFFF2651),
                                    child: Text(
                                      'Appeared :',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: 160,
                                child: Container(
                                  child: Card(
                                    color: Color(0xFFFF2651),
                                    child: Text(
                                      '19.02.2022',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: 150,
                                child: Container(
                                  child: Card(
                                    color: Color(0xFFFF2651),
                                    child: Text(
                                      'Attempted :',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                width: 160,
                                child: Container(
                                  child: Card(
                                    color: Color(0xFFFF2651),
                                    child: Text(
                                      '19.02.2022',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    width: 150,
                                    child: Container(
                                      child: Card(
                                        color: Color(0xFFFF2651),
                                        child: Text(
                                          'Marks Obtained :',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    width: 160,
                                    child: Container(
                                      child: Card(
                                        color: Color(0xFFFF2651),
                                        child: Text(
                                          '3/360',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: _ChekResult,
                                child: Text('Check Result'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _ChekResult() {
  //  Navigator.push(context, MaterialPageRoute(builder: (_)=>ResultPage()));
  }
}
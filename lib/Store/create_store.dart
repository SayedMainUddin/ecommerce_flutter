import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_flutter/Models/store_model.dart';
import 'package:ecommerce_flutter/Profile/store_profile.dart';

import 'package:ecommerce_flutter/Screens/brows.dart';
import 'package:ecommerce_flutter/Screens/wish_list.dart';
import 'package:ecommerce_flutter/Store/AddProduct.dart';
import 'package:ecommerce_flutter/Store/edit_product.dart';
import 'package:ecommerce_flutter/TabPage.dart';

import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/myCart.dart';

import 'package:ecommerce_flutter/utils/bottomNavBarDesign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:ecommerce_flutter/utils/favourite_button.dart';
import 'package:flutter/rendering.dart';

import '../widgets/sub_header_widget.dart';

class CreateStorePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CreateStorePage> {
  PageController? _pageController;

  initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                height: MediaQuery.of(context).size.height * 0.15,
                color: Color(0xF80687F6),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*        InkWell(

                      child: Icon(Icons.arrow_back_ios),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),*/

                        Container(
                          child: Text(
                            'My Store',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite, color: Colors.red),
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
                            IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
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
                  ],
                ),
              ),
              LocalStorage.storeId == '' || LocalStorage.storeId == null
                  ? Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset('assets/store.jpg'),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(115, 60, 70, 30),
                          child: Container(
                            child: Icon(Icons.attach_money,
                                size: 40, color: Colors.lime),
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              borderRadius:
                              BorderRadius.all(Radius.circular(60.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4.0,
                              ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 30),
                      child: Container(
                        child: Text(
                          'You Do not have a store?',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, left: 10, right: 10, bottom: 10),
                    child: ElevatedButton(
                      child:
                      Text("Create Store", style: TextStyle(fontSize: 22)),
                      onPressed: _createStore,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xF80687F6),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : SingleChildScrollView(
                child:ProductPage(),
              )
            ],
          ),
        ));
  }

  void _createStore() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CreateStore()));
  }
}

class CreateStore extends StatefulWidget {
  @override
  State<CreateStore> createState() => _CreateStoreState();
}

class _CreateStoreState extends State<CreateStore> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
              height: MediaQuery.of(context).size.height * 0.15,
              color: Color(0xF80687F6),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back_ios),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        child: Text(
                          'My Store',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset('assets/store.jpg'),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(115, 60, 70, 30),
                    child: Container(
                      child: Icon(Icons.attach_money,
                          size: 40, color: Colors.lime),
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        borderRadius: BorderRadius.all(Radius.circular(60.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 30),
                child: Container(
                  child: Text(
                    'This information is used to set up your shop',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 30),
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Store Name?',
                        labelText: 'Name Name',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Store Web Address?',
                        labelText: 'Store Web Address',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Store Description?',
                        labelText: 'Store Description',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Store Type?',
                        labelText: 'Store Type',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Address?',
                        labelText: 'Address',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your City?',
                        labelText: 'City',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Country?',
                        labelText: 'Country',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Courier Name?',
                        labelText: 'Courier Name',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Tagline?',
                        labelText: 'Tagline',
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          child: Text("Create", style: TextStyle(fontSize: 22)),
          onPressed: _create,
          style: ElevatedButton.styleFrom(
            primary: Color(0xF80687F6),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }

  void _create() {
    Navigator.pop(context);
    var pageIndex = 2;
    LocalStorage.storeId = '123';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => HomePage(
                  pageIndex: pageIndex,
                )));
  }
}

class ProductPage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<ProductPage> {
  final double circleRadius = 120.0;
  bool isFollowed = false;
  var isDownloaded = false;
  final List<String> imgList = [
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

  _products() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: <Widget>[
          roundedRectBorderWidget,
   SizedBox(
     width: 10,
   ),
          Row(
              children: List.generate(imgList.length, (index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
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
                              /*         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Products(
                                    imageUrl: i,
                                  )));*/
                            },
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.15,
                                      width: MediaQuery.of(context).size.width*0.45,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                                            image: AssetImage(
                                              imgList[index],
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
                                      padding: EdgeInsets.only(top: 1),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [     Container(
                                                height: MediaQuery.of(context).size.height*0.03,
                                                width: MediaQuery.of(context).size.height*0.03,

                                                decoration: BoxDecoration(
                                                    color: Color(0xF80687F6),
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
                                                  color: Color(0xF80687F6),
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child:    Container(
                        color: Colors.black26,
                        height: 60,
                        width: 60,
                        child: IconButton(

                          onPressed: () {
                 /*           setState(
                                  () {
                                _strings.removeAt(0);
                              },
                            );
                            print(_strings.length);*/
                          },

                          icon: Icon(Icons.edit,size: 40,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 20, 0, 20),
                      
                      child:    Container(
                        color: Colors.black26,
                        height: 60,
                        width: 60,

                        child: IconButton(

                          onPressed: () {
                            /*           setState(
                                  () {
                                _strings.removeAt(0);
                              },
                            );
                            print(_strings.length);*/
                          },

                          icon: Icon(Icons.delete_forever,size: 40,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                );
              })
          )
        ],
      ),
    );
  }
  Widget get roundedRectBorderWidget {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProductPage()));
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: MediaQuery.of(context).size.height*0.22,
              width: MediaQuery.of(context).size.width*0.40,
            color: Colors.white12,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 40, color: Colors.black45),
                  Text('Add Product',
                    style: TextStyle(fontSize: 18, color: Colors.black45),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double y = MediaQuery.of(context).size.width;
    return WillPopScope(child: SingleChildScrollView(
      child: Container(
        padding:EdgeInsets.fromLTRB(0, 0, 0, 10) ,
        child: Column(
          children: [
            Container(
              height: h * 0.30,
              // height: double.infinity,
              width: double.infinity,
              //  width: double.infinity,
              color: Color(0xffE0E0E0),
              child: Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  color: Color(0xF80687F6),
                ),
                /*    Container(
                     color: Color(0xF80687F6),
                   ),*/

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: circleRadius / 2.0,
                        ),

                        ///here we create space for the circle avatar to get ut of the box
                        child: Container(
                          height: h * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Padding(
                              padding:
                              const EdgeInsets.only(top: 20.0, bottom: 5.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: circleRadius / 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10,20, 10, 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                            onPressed: onEdit,
                                            label: Text(
                                              "Edit",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                                foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Color(0xF80687F6)),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                        side:
                                                        BorderSide(color: Colors.white))))),
                                        ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.view_comfortable_outlined,
                                              color: Colors.white,
                                            ),
                                            onPressed: onViewPressed,
                                            label: Text(
                                              "View",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                                foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Color(0xF80687F6)),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                        side:
                                                        BorderSide(color: Colors.white))))),
                                        ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.view_comfortable_outlined,
                                              color: Colors.white,
                                            ),
                                            onPressed: _onRemove,
                                            label: Text(
                                              "Remove",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                                foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Color(0xF80687F6)),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                        side:
                                                        BorderSide(color: Colors.white))))),
                                      ],
                                    ),
                                  ),



                                ],
                              )),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Center(
                          child: Container(
                            child: Text('Tradly Store',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),

                          ),
                        ),
                      ),



                      ///Image Avatar
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Container(
                          width: circleRadius,
                          height: circleRadius,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Center(
                              child: Container(
                                child: Text('T',style: TextStyle(fontSize: 70),),

                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ]),
            ),
            LocalStorage.productId==''|| LocalStorage.productId==null?
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 30),
                    child: Container(
                      child: Text(
                        'You Do not have Products',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: 0, left: 10, right: 10, bottom: 10),
                  child: ElevatedButton(
                    child:
                    Text("Add Product", style: TextStyle(fontSize: 22)),
                    onPressed: _addProduct,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xF80687F6),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
                :Column(
              children: [
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(10,0, 0, 0),
                  child: Text('Products',style: TextStyle(fontSize: 22,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                ),

                Container(
                  height: MediaQuery.of(context).size.height*0.35,

                  padding: EdgeInsets.fromLTRB(10,0, 0, 10),
                  child:  ListView(
                    children: [
                      _products()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ), onWillPop: () async{
      return false;
    });
  }
void onViewPressed(){
  Navigator.push(context, MaterialPageRoute(builder: (_)=>StoreProfilePage()));

}
  void onPressed() {}

  void _onRemove() {
    LocalStorage.storeId = '';
    Navigator.pop(context);
    var pageIndex = 2;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => HomePage(
              pageIndex: pageIndex,
            )));

  }

  void onEdit() {
Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProductPage()));
  }

  void _addProduct() {
    Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProductPage()));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_flutter/Models/store_model.dart';

import 'package:ecommerce_flutter/Screens/brows.dart';
import 'package:ecommerce_flutter/Store/AddProduct.dart';

import 'package:ecommerce_flutter/TabPage.dart';

import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';

import 'package:ecommerce_flutter/utils/bottomNavBarDesign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:ecommerce_flutter/utils/favourite_button.dart';
import 'package:flutter/rendering.dart';

import '../widgets/sub_header_widget.dart';

class EditProductPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<EditProductPage> {
  PageController? _pageController;

  initState() {}
  final double circleRadius = 120.0;
  bool isFollowed = false;
  var isDownloaded = false;
  List<Widget> _strings = [];
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
          _strings.length<=3? roundedRectBorderWidget:Container(),
          SizedBox(
            width: 10,
          ),
          Row(children: [
            Container(
              height: 150,
              width: _strings.length<=3?200:MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _strings.length,
                itemBuilder: (context, index) => _strings[index],
              ),
            ),

          ]
            /* List.generate(imgList.length, (index) {
                return Padding(
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
                          print('Click Photo');
                          */ /*         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Products(
                                    imageUrl: i,
                                  )));*/ /*
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
                                          imgList[index],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),


                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              )*/
          )
        ],
      ),
    );
  }

  Widget get roundedRectBorderWidget {
    return InkWell(
      onTap: () {
        print(_strings.length);
        setState(
              () {
            _strings.add(
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        //  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),

                          image: AssetImage(
                            "assets/images/shoes_4.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),

                  Container(
                    height: 40,
                    width: 40,
                    child:     IconButton(
                      onPressed: (){

                        setState(
                              () {
                            _strings.removeAt(0);
                          },
                        );
                        print(_strings.length);
                      },
                      icon: Icon(Icons.highlight_remove_outlined,color: Colors.deepOrangeAccent),
                    ),
                  )

                ],
              ),
            );
          },
        );
        print(_strings.length);
        //Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePagePayment()));
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.40,
            color: Colors.white12,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 40, color: Colors.black45),
                  Text(
                    'Add Photo',
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  )
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
              height: MediaQuery.of(context).size.height * 0.15,
              color: Color(0xF80687F6),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        child: Text(
                          'Edit Product',
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
            Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: ListView(
                      children: [

                        _products(),

                      ],
                    ),
                  ),
                ),
                _strings.length==4? Text('Max, 4 photos per product.'):Text('${_strings.length} photos added.')
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Product Name?',
                        labelText: 'Product Name',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Product Category?',
                        labelText: 'Product Category',
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Flexible(
                          child: new TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            decoration: const InputDecoration(
                                hintText: 'What is your Product Price?',
                                labelText: 'Price',
                                icon: Icon(Icons.attach_money)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        new Flexible(
                          child: new TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            decoration: const InputDecoration(
                                hintText: 'What is your Product Offer Price?',
                                labelText: 'Offer Price',
                                icon: Icon(Icons.attach_money)),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Location Details?',
                        labelText: 'Location Details',
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'Add Your Product Description?',
                        labelText: 'Product description',
                      ),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'What is your Product Price Type?',
                        labelText: 'Price Type',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: 'What is your Product Additional Details?',
                        labelText: 'Additional Details',
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          child: Text("Add Product", style: TextStyle(fontSize: 22)),
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
    );
  }

  void _createStore() {
    //Navigator.push(context, MaterialPageRoute(builder: (_) => CreateStore()));
  }

  void _addProduct() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddProductPage()));
  }

  void _removePhoto(value) {
    setState(
          () {
        _strings.removeAt(value);
      },
    );
    print(_strings.length);
  }
}

List<Product> productList = [
  Product(
    id: 1,
    name: 'Ready To Deliver To Your Home',
    Price: '10',
    select: false,
  ),
  Product(
    id: 2,
    name: 'Ready To Deliver To Your Home',
    Price: '10',
    select: false,
  ),
  Product(
    id: 3,
    name: 'Ready To Deliver To Your Home',
    Price: '10',
    select: false,
  ),
];

class Product {
  int? id;
  String? name;
  String? Price;
  bool? select = false;

  Product({this.name, this.id, this.Price, this.select});
}

import 'package:ecommerce_flutter/Models/store_model.dart';
import 'package:ecommerce_flutter/Profile/searchItembyStore.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

//import 'CheckOutPage.dart';

class StoreProfilePage extends StatefulWidget {
  StoreProfilePage({Key? key,}) : super(key: key);
  @override
  _StoreProfilePage createState() => _StoreProfilePage();
}

class _StoreProfilePage extends State<StoreProfilePage> {
  bool isFollow=false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar:  PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Color(0xF80687F6),
                  child: Column(
                    children: [
                      Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                        /*  InkWell(
                            child: Icon(Icons.arrow_back_ios, color: Colors.white),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),*/
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Tradly Store',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                              onPressed: _searchProduct,
                              icon: Icon(Icons.search,color: Colors.white,))

                        ],
                      ),
                    ],
                  ),
                )),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      color: Color(0xFFFFFFF),
                      height: MediaQuery.of(context).size.height*.30,
                      child: Padding(
                        padding:EdgeInsets.fromLTRB(20, 10, 20, 2),
                        child: Column(

                          children: <Widget>[
                            Row(

                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height*0.10,
                                    width: MediaQuery.of(context).size.height*0.10,

                                    decoration: BoxDecoration(
                                        color: Color(0xF80687F6),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black
                                        )
                                    ),
                                    child:Container(
                                      alignment: Alignment.center,
                                      child:  Text('T',style: TextStyle(
                                          fontSize: 45,color: Colors.white,fontWeight: FontWeight.w600
                                      ),),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('Tradly Team',
                                          style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        child: Text('01892859825',
                                            style: TextStyle(
                                                color: Colors.black45)
                                        ),
                                      ),

                                    ],
                                  ),),

                                ElevatedButton(
                                  child:isFollow==true?Text("Follow"):Text("Followed"),
                                  onPressed: () {

                                    setState(() {

                                      isFollow=!isFollow;
                                    });
                                    print("it's pressed follow");
                                    print(isFollow);

                                  } ,
                                  style: ElevatedButton.styleFrom(
                                    primary: isFollow==true?Color(0xF80687F6):Colors.black12,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Text('flutter update-packages r update the Flutter SDK by using the flutter upgrade command flutter upgradeThis command gets the most recent version of the Fluttert’s available on your current Flutter channel.More information on how to upgrad the Flutter SDK or switching Flutter channelszzzz',
                                  maxLines:100,
                                  style: TextStyle(
                                      color: Colors.black45)
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(

                                    icon: const Icon(
                                      Icons.highlight_remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: onRemove,
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
                                SizedBox(width: 30,),
                                ElevatedButton.icon(

                                    icon: const Icon(
                                      Icons.highlight_remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: onRemove,
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
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 10, 20, 2),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.15,
                      width: double.infinity,

                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,color: Colors.white,
                        child: Container(

                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*.03,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*.30,
                                    child: Text('Total Followers',style: TextStyle(fontSize: 16,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.03,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*.30,
                                    child: Text('0',style: TextStyle(fontSize: 16,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                                  ),
                                ],
                              ),  Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*.03,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*.30,
                                    child: Text('Total Products',style: TextStyle(fontSize: 16,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.03,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*.30,
                                    child: Text('0',style: TextStyle(fontSize: 16,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                                  ),
                                ],
                              )


                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Container(

                    height: MediaQuery.of(context).size.height*0.06,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: storeList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.white24,
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
                              /*      Navigator.push(
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

                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context).size.height*0.05,
                                            width: MediaQuery.of(context).size.width*0.45,
                                    child: Text(i.category,style: TextStyle(color: Colors.black),),
                                          ),


                                        ],
                                      ),

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

                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 2),
                      children: List.generate(imgList_chair.length, (index) {
                        return Container(

                          height: 600,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {
                                print('Card tapped.');
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(30),
                                        height: 100,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(


                                              image: AssetImage(
                                                imgList_chair[index],
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),


                                    ],
                                  ),
                                  ListTile(
                                      title:
                                      Text(
                                        'Fish',
                                        style: TextStyle(fontFamily: 'Montserrat',fontSize: 25,color: Colors.black45,fontWeight: FontWeight.w400),
                                      ),
                                      /*  Text(
                                                'One chair',
                                                style: TextStyle(fontSize: 18,fontFamily: 'bold'),
                                              ),*/
                                      subtitle: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [     Container(
                                                height: 40,
                                                width: 40,

                                                decoration: BoxDecoration(
                                                    color: Color(0xF80687F6),
                                                    shape: BoxShape.circle,
                                                    border: Border.all()
                                                ),
                                                child:Container(
                                                  alignment: Alignment.center,
                                                  child:  Text('T',style: TextStyle(
                                                      fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900
                                                  ),),
                                                )
                                            ),
                                              Container(
                                                child: Text('Tredy',style: TextStyle(
                                                    color: Colors.black26,fontSize: 18,fontWeight: FontWeight.w900
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
                                      )
                                  )

                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )

                ],
              ),
            )
          ),
        ),
        onWillPop: () async {

          return true;
        });
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\$299.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              //  Navigator.push(context, new MaterialPageRoute(builder: (context) => CheckOutPage()));
            },
            color: Colors.green,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.white),
            ),
          ),
          Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(

      alignment: Alignment.topLeft,
      child: Text(
        "Order History",
        style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 30, color: Colors.black),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total(3) Orders",
        style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 14, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }
  transections() {
    return    Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12, top: 4),
      height: 40,
      child: Row(
        children: [
          Text('Transections',style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 22
          ),),
          SizedBox(
            width: 20,
          ),
          Text('January 2022',style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue
          ),),
        ],
      ),
    );

  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem();
      },
      itemCount: 15,
    );
  }

  createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(image: AssetImage("assets/images/shoes_1.png"))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "NIKE XTM Basketball Shoeas",
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        "Green M",
                        style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\$299.00",
                              style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.green),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 150,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 20, top: 80),
            child:Text('Payment Confirmed',style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.green),
          ),
        )
      ],
    );
  }

  void onRemove() {

  }

  void _searchProduct() {
    Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchProductFromStorePage()));
  }
}


class CustomTextStyle {
  static var textFormFieldRegular = TextStyle(
      fontSize: 16,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400);

  static var textFormFieldLight =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}

class Utils {
  static getSizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
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

import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Screens/wish_list.dart';
import 'package:ecommerce_flutter/Welcome/logo_screen.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/myCart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

//import 'CheckOutPage.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key,}) : super(key: key);
  @override
  _UserProfilePage createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfilePage> {
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


                            Container(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
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
                  )),
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.grey.shade100,
              body: Stack(
                children: [
                  Container(
                      color: Color(0xF80687F6),
                      height: MediaQuery.of(context).size.height*.30,
                      child: Padding(
                        padding:EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                                            color: Colors.white
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
                                          style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        child: Text('01892859825',
                                            style: TextStyle(
                                                color: Colors.white)
                                        ),
                                      ),
                                      Container(
                                        child: Text('info@tradly.com',
                                            style: TextStyle(
                                                color: Colors.white)
                                        ),
                                      ),
                                    ],
                                  ),)
                              ],
                            )


                          ],
                        ),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.40,
                      width: MediaQuery.of(context).size.width*.90,

                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Divider(height: 2,),
                              Container(
                                height: MediaQuery.of(context).size.height*.05,
                                width: double.infinity,
                                child: Text('Edit Profile',style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                              ),
                              Divider(height: 2,),
                              Container(
                                height: MediaQuery.of(context).size.height*.05,
                                width: double.infinity,
                                child: Text('Language and Currency',style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                              ),
                              Divider(height: 2,),
                              Container(
                                height: MediaQuery.of(context).size.height*.05,
                                width: double.infinity,
                                child: Text('Feedback',style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                              ),
                              Divider(height: 2,),
                              Container(
                                height: MediaQuery.of(context).size.height*.05,
                                width: double.infinity,
                                child: Text('Refer a Friend',style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                              ),
                              Divider(height: 2,),
                              Container(
                                height: MediaQuery.of(context).size.height*.05,
                                width: double.infinity,
                                child: Text('Terms and Conditions',style: TextStyle(fontSize: 20,color: Colors.black45,fontWeight: FontWeight.w500),) ,

                              ),
                              Divider(height: 2,),
                             InkWell(onTap: (){
                               Navigator.push(context,MaterialPageRoute(builder: (_)=>LogoPage()));
                             },
                               child:  Container(
                                 height: MediaQuery.of(context).size.height*.05,
                                 width: double.infinity,
                                 child: Text('Logout',style: TextStyle(fontSize: 22,color: Color(0xF80687F6),fontWeight: FontWeight.w700),) ,

                               ),
                             ),
                              Divider(height: 2,)

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
                  )
                ],
              )
          ),
        ),
        onWillPop: () async {
          Navigator.pop(context);
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
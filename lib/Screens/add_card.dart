import 'package:ecommerce_flutter/Payment/home.dart';

import 'package:ecommerce_flutter/Screens/address_screen.dart';
import 'package:ecommerce_flutter/Screens/stripe_payemnt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:numberpicker/numberpicker.dart';

class AddCardPage extends StatefulWidget {
/*  final productImage;
  final productName;
  MyCartPage({
    this.productImage,
    this.productName,
  });*/
  @override
  State<AddCardPage> createState() => _AddCardPage();
}

class _AddCardPage extends State<AddCardPage> {
  /// Draw a border with rectangular border
  Widget get rectBorderWidget {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  /// Draw a border with a rounded rectangular border
  Widget get roundedRectBorderWidget {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HomePagePayment()));
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: 150,
            width: 250,
            color: Colors.white12,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 40, color: Colors.black45),
                  Text('Add Card',
                    style: TextStyle(fontSize: 18, color: Colors.black45),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _appBar(height) =>
      PreferredSize(
        preferredSize: Size(MediaQuery
            .of(context)
            .size
            .width, height + 10),
        child: Stack(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,
                  color: Color(0xFF19818E),
                  child: Column(
                    children: [
                      Row(

                        children: [
                          Row(
                            children: [

                              IconButton(
                                icon: Icon(Icons.arrow_back_ios, color: Colors
                                    .white,),
                                onPressed: () {

                                },
                              )
                            ],
                          ),
                          SizedBox(width: 50,),
                      Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Add Card',
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


              ],
            )

          ],
        ),
      );

  int _currentIntValue = 10;
  int _currentHorizontalIntValue = 10;
  int price = 100;
  var debitOrCredit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(AppBar().preferredSize.height),
      body: SingleChildScrollView(
        child: Column(

          children: [
            InkWell(
                onTap: () => _addAddress(),
                child: Container(
                  color: Colors.greenAccent.withOpacity(0.09),
                  padding: EdgeInsets.only(left: 0),
                  alignment: Alignment.center,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.25,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: <Widget>[

                          roundedRectBorderWidget,

                        ],
                      ),
                    ),
                  ),
                )
            ),

      Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(

              hintText: 'Enter your card number',
              labelText: 'Card Number *',
            ),

          ),
Divider(),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(

              hintText: 'Enter card holder name',
              labelText: 'Name *',
            ),

          ),
          Divider(),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(

              hintText: 'Enter card Expires dates',
              labelText: 'Expires Dates *',
            ),

          ),
          Divider(),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(

              hintText: 'Enter card CVC',
              labelText: 'CVC *',
            ),

          ),
        ],
      ),)



          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: ElevatedButton(

          child: Text("Add Credit Card",style: TextStyle(fontSize: 22)),
          onPressed: _checkout,
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF19818E),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }


  void _paymentSubmit() {
/*    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PaymentPage()));*/
  }

  void _addAddress() {

  }

  void _selectDebitOrCreditCard(Object? value) {
  }

  void _checkout() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => StripePayment()));
  }
}



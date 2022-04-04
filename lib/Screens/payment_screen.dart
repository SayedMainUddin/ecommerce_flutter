import 'package:ecommerce_flutter/Payment/home.dart';
import 'package:ecommerce_flutter/Payment/order_details.dart';
import 'package:ecommerce_flutter/Screens/add_card.dart';
import 'package:ecommerce_flutter/Screens/address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
class PaymentPage extends StatefulWidget {
  final isValid;
  final cardNumber ;
  final expiryDate;
  final cardHolderName ;
  final cvvCode ;
 // final useBackgroundImage ;
  PaymentPage({
    this.isValid,
    this.cardHolderName,
    this.cardNumber,
    this.cvvCode,
    this.expiryDate,
  //  this.useBackgroundImage

});
/*  final productImage;
  final productName;
  MyCartPage({
    this.productImage,
    this.productName,
  });*/
  @override
  State<PaymentPage> createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {

  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePagePayment()));
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
                  Text('Add Payment Method',
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
                  color: Color(0xF80687F6),
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
                                  Navigator.pop(context);
                                  /*    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Home()));*/
                                },
                              )
                            ],
                          ),
                          SizedBox(width: 50,),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Payment Option',
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

            widget.isValid=='valid'? CreditCardWidget(
              glassmorphismConfig:
              useGlassMorphism ? Glassmorphism.defaultConfig() : null,
              cardNumber: widget.cardNumber,
              expiryDate: widget.expiryDate,
              cardHolderName: widget.cardHolderName,
              cvvCode: widget.cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Color(0xD7878),
              backgroundImage:
              useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/mastercard.png',
                    height: MediaQuery.of(context).size.height*0.05,
                    width:  MediaQuery.of(context).size.height*0.05,
                  ),
                ),
              ],
            ):
            InkWell(
                onTap: () => _addAddress(),
                child: Container(
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



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Container(
                  height: 10,
                  width: 10,

                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                  ),
                ),
                SizedBox(width: 3,),
                Container(
                  height: 10,
                  width: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                  ),
                ),
                SizedBox(width: 3,),
                Container(
                  height: 10,
                  width: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                  ),
                )
              ],
            ),
            Divider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: debitOrCredit,
                          onChanged: _selectDebitOrCreditCard,
                      activeColor: Color(0xF80687F6),
                      ),

                      Text('Debit/Credit Card', style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: debitOrCredit,
                          onChanged: _selectDebitOrCreditCard),
                      Text('Netbanking', style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),   Divider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: debitOrCredit,
                          onChanged: _selectDebitOrCreditCard),
                      Text('Cash on Delivery', style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: debitOrCredit,
                          onChanged: _selectDebitOrCreditCard),
                      Text('Wallet', style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('Deliver to Main Bhai Team,75119', style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        child: Text('Yahya Tower, Lalkhan Bazar, Chittagong',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  ElevatedButton(

                    child: Text(
                        "Change", style: TextStyle(fontSize: 13)),
                    onPressed: _paymentSubmit,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xF80687F6),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 20, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('Price Details', style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        child: Text('Price ( 1 item )', style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  Container(
                    child: Text('\$25', style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: ElevatedButton(

          child: Text("Checkout",style: TextStyle(fontSize: 22)),
          onPressed: widget.isValid=='valid'?_checkout:_noData,
          style: ElevatedButton.styleFrom(
            primary: widget.isValid=='valid'?Color(0xF80687F6):Color(0xFF719499),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }
void _noData(){

}

  void _paymentSubmit() {
/*    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PaymentPage()));*/
  }

  void _addAddress() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => AddCardPage()));
  }

  void _selectDebitOrCreditCard(Object? value) {
    if(value==1){
      Navigator.push(context, MaterialPageRoute(
          builder: (_)=>HomePagePayment())
      );
    }
  }

  void _checkout() {
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => OrderDetailsPage()));
/*    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => AddCardPage()));*/
  }
}



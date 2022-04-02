import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Screens/address_screen.dart';
import 'package:ecommerce_flutter/Screens/payment_screen.dart';
import 'package:ecommerce_flutter/TabPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
/*  final productImage;
  final productName;
  final productPrice;
  final productOffer;
  final productQuantity;
  final productId;
  final orderId;
  OrderDetailsPage({
    this.productImage,
    this.productName,
    this.orderId,
    this.productId,
    this.productOffer,
    this.productPrice,
    this.productQuantity,
  });*/
  @override
  State<OrderDetailsPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<OrderDetailsPage> {
  final double circleRadius = 120.0;
  List<String> labels = [
    "Step 0",
    "Step 1",
    "Step 2",
    "Step 3",
    "Step 4",
    "Step 5",
    "Step 6",
    "Step 7"
  ];
  int stepValue = 2;
  int _currentIntValue = 10;
  int price = 100;
bool isOrderPlaced=true;
bool isPaymentConfirmed=true;
bool isProcessed=false;
bool isDelivered=false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double y = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Details'),
        backgroundColor: Color(0xFF19818E),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              color: Color(0xFFDAE5E3),
              padding: EdgeInsets.only(left: 2,top: 20),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
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
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: AssetImage('assets/done.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(60.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Thanks for Order',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            LocalStorage.productImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocalStorage.productName,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      '\$${price * _currentIntValue}',
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text('\$190',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Quantity: $_currentIntValue',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 0, left: 20, right: 10, bottom: 10),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Track Order',style: TextStyle(
                    fontSize: 22
                  ),),
                  Text('Order Id : ${'209209'}',style: TextStyle(
                      fontSize: 16
                  ),),
                  Container(

                    height: 2,
                    color: Colors.cyan,
                    width: 150,
                  )
                ],

              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
              child: Table(
                columnWidths: {0: FractionColumnWidth(.7)},
                //  border: TableBorder.all(color: Colors.black),
                children: [

                  TableRow(children: [
                   Padding(
                     padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                   child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text('Order Placed',
                               style: TextStyle(
                                   color: Colors.black87,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16)),
                           isOrderPlaced?Icon(Icons.done,color: Colors.green,):Icon(Icons.transfer_within_a_station,color: Colors.deepOrangeAccent,)
                         ],
                       ),
                       Text('Order #123456 from Fashion Point',
                           style: TextStyle(
                               color: Colors.black26,
                               fontWeight: FontWeight.w500,
                               fontSize: 14)),
                     ],
                   ),
                   ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('05/02/2019',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text('11am',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),

                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Payment Confirmed',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              isPaymentConfirmed?Icon(Icons.done,color: Colors.green,):Icon(Icons.transfer_within_a_station,color: Colors.deepOrangeAccent,)
                            ],
                          ),
                          Text('Payment Status',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('05/02/2019',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text('11am',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),



                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Processed',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              isProcessed?Icon(Icons.done,color: Colors.green,):Icon(Icons.transfer_within_a_station,color: Colors.deepOrangeAccent,)
                            ],
                          ),
                          Text('Processed Status',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('05/02/2019',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text('11am',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),

                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Row(
                           children: [
                             Text('Delivered',
                                 style: TextStyle(
                                     color: Colors.black87,
                                     fontWeight: FontWeight.w500,
                                     fontSize: 16)),
                             isDelivered?Icon(Icons.done,color: Colors.green,):Icon(Icons.transfer_within_a_station,color: Colors.deepOrangeAccent,)
                           ],
                         ),
                          Text('Delivered Status',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('05/02/2019',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text('11am',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ],
                      ),
                    ),



                  ]),
                ],
              ),
            ),
            Divider(
              height: 20,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Delivery Address',style: TextStyle(
                    fontSize: 22,
                  ),),
                  Divider(),
                  Text('Jumon Enterprise',style: TextStyle(
                    fontSize: 20,
                  ),),
                  Container(
                    alignment: Alignment.topCenter,
                    //padding:EdgeInsets.fromLTRB(30, 2, 30, 2),
                    child:Text('SoltGola Railway Shoping Complex, Chittagong',style: TextStyle(
                      fontSize: 16,
                    ), textAlign: TextAlign.center,),

                  ),
                  Text('Contact: ${'01676075829'}',style: TextStyle(
                    fontSize: 14,
                  ),),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),

          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          child:
          Text("Back to Home", style: TextStyle(fontSize: 22)),
          onPressed: _backHome,
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF19818E),
            onPrimary: Colors.white,

          ),
        ),
      ),
    );
  }

  void _backHome() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  void _addAddress() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddressPage()));
  }
}

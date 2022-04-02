import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Payment/order_details.dart';
import 'package:ecommerce_flutter/Screens/address_screen.dart';
import 'package:ecommerce_flutter/Screens/payment_screen.dart';
import 'package:ecommerce_flutter/TabPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class MyCartPage extends StatefulWidget {
  final productImage;
  late final productName;

  MyCartPage({
    this.productImage,
    this.productName,
  });

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  var productid = 1;
  var orderid = 0;
  _appBar(height) => PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, height + 65),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.10,
                  color: Color(0xFF19818E),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    LocalStorage.productName=widget.productName;
                                  });

                                  Navigator.pop(context);
/*                                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage(pageIndex: 0,)));*/
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'My Cart',
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
                orderid==0 || _currentIntValue==0?Container():InkWell(
                  onTap: () => _addAddress(),
                  child: Container(
                    padding: EdgeInsets.only(left: 100),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          'Add New Address',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

  int _currentIntValue =10;
  int _currentHorizontalIntValue = 10;
  int price = 100;

  @override
  void initState() {
    LocalStorage.productImage = widget.productImage;
    LocalStorage.productName = widget.productName;
    print(LocalStorage.productName);
    print(widget.productName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(AppBar().preferredSize.height),
        body: widget.productName == '' ||_currentIntValue==0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text('You have not added anything to your cart!',    style: TextStyle(
                        fontSize: 16, color: Colors.black54),),
                  ),
                 Container(
                   alignment: Alignment.center,
                   child:  Padding(
                     padding: EdgeInsets.only(
                         top: 0, left: 10, right: 10, bottom: 10),
                     child: ElevatedButton(
                       child: Text("Browse",
                           style: TextStyle(fontSize: 22)),
                       onPressed:(){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage(pageIndex: 0,)));
                       },
                       style: ElevatedButton.styleFrom(
                         primary: Color(0xFF19818E),
                         onPrimary: Colors.white,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(32.0),
                         ),
                       ),
                     ),
                   ),
                 )
                ],
              )
            : Column(
                children: [
                  Divider(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  widget.productImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Text(
                                      widget.productName,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black54),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
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
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () => setState(() {
                                            final newValue =
                                                _currentIntValue - 1;
                                            _currentIntValue =
                                                newValue.clamp(0, 100);
                                            print(
                                                "${price * _currentIntValue}");
                                          }),
                                        ),
                                        Text(
                                          'Current Quantity: $_currentIntValue',
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () => setState(() {
                                            final newValue =
                                                _currentIntValue + 1;
                                            _currentIntValue =
                                                newValue.clamp(0, 100);
                                            //var total=;
                                            print(
                                                "${price * _currentIntValue}");
                                          }),
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
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Card(
                        child: Container(

                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: InkWell(
                            onTap: (){
var _productId=0;
                              setState(() {
                                _currentIntValue=0;
                                LocalStorage.orderId=_productId;

                              });

                            },
                          child: Text('Remove'),
                          ),
                        ),
                      )),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Table(
                      columnWidths: {0: FractionColumnWidth(.8)},
                      //  border: TableBorder.all(color: Colors.black),
                      children: [
                        TableRow(children: [
                          Text('Price($_currentIntValue item)',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                          Text('\$${price * _currentIntValue}',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Delivery Fee',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Info',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Total Amount :',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('\$${price * _currentIntValue}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, left: 10, right: 10, bottom: 10),
                    child: ElevatedButton(
                      child: Text("Continue to Payment",
                          style: TextStyle(fontSize: 22)),
                      onPressed: _paymentSubmit,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF19818E),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }



  void _paymentSubmit() {
    orderid=1;
    //OrderDetailsPage(productName: widget.productName,productImage: widget.productImage,orderId:orderid ,productId:productid ,productOffer: '50% 0ff',productPrice: 500,productQuantity: 1,);
    Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentPage()));
  }

  void _addAddress() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddressPage()));
  }
}

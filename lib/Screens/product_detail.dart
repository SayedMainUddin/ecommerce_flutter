import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/LocalStorage.dart';
import 'package:ecommerce_flutter/Screens/wish_list.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/myCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
class Products extends StatefulWidget {
  final imageUrl;

  Products({this.imageUrl});

  @override
  _ProductsState createState() => _ProductsState();
}
enum Share {
  facebook,
  messenger,
  twitter,
  whatsapp,
  whatsapp_personal,
  whatsapp_business,
  share_system,
  share_instagram,
  share_telegram
}
class _ProductsState extends State<Products> {
  String _platformVersion = 'Unknown';
  double rating = 0.0;

var productName='Beautiful Product';

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  Future<void> onButtonTap(Share share) async {
    String msg =
        'Flutter share is great!!\n Check out full example at https://pub.dev/packages/flutter_share_me';
    String url = 'https://pub.dev/packages/flutter_share_me';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    switch (share) {
      case Share.facebook:
        response = await flutterShareMe.shareToFacebook(url: url, msg: msg);
        break;

      case Share.twitter:
        response = await flutterShareMe.shareToTwitter(url: url, msg: msg);

        break;
      case Share.whatsapp_business:
        response = await flutterShareMe.shareToWhatsApp(msg: msg);
        break;
      case Share.share_system:
        response = await flutterShareMe.shareToSystem(msg: msg);
        break;

    }
    debugPrint(response);
  }
  @override
  Widget build(BuildContext context) {
    final imageUrl;
    return Scaffold(
     /*   appBar: AppBar(
          backgroundColor: Color(0xF80687F6),
          title: Text('Product Detail'),
        ),*/
        body:Padding(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),

          child:  SafeArea(
            top: false,
            left: false,
            right: false,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                 Column(
                   children: [

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         Container(
                           child: IconButton(icon:Icon( Icons.arrow_back_ios),
                           onPressed: _backButton,
                         ),),
                         Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [

                             Container(
                               child: IconButton(icon:Icon( Icons.share),
                                 onPressed: () => onButtonTap(Share.share_system),
                               ),),
                             SizedBox(width: 5,),

                             Container(
                               child: IconButton(icon:Icon( Icons.favorite_border),
                                 onPressed: _wishList,
                               ),),
                             SizedBox(width: 5,),


                             Container(
                               child: IconButton(icon:Icon( Icons.more_vert),
                                 onPressed: _backButton,
                               ),),
                           ],
                         )
                       ],
                     ),
                     SizedBox(
                       width: double.infinity,
                       height: 260,
                       child: Hero(
                         tag: widget.imageUrl,
                         child: Image.asset(widget.imageUrl),

                       ),
                     ),

                   ],
                 ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              'Beautiful Products',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      '\$90',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
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
                                children: <Widget>[
                                  RatingStars(
                                    value: 5,
                                    starColor: Colors.amber,
                                    /*     onValueChanged: (v) {
                              //
                              setState(() {
                                rating = v;
                              });
                              print(rating);
                            },*/
                                    starBuilder: (index, color) => Icon(
                                      Icons.star_border,
                                      color: color,
                                    ),
                                    starCount: 5,
                                    starSize: 30,
                                    //  valueLabelColor: const Color(0xff9b9b9b),
                                    valueLabelTextStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    valueLabelRadius: 10,
                                    maxValue: 5,
                                    starSpacing: 2,
                                    maxValueVisibility: true,
                                    valueLabelVisibility: true,
                                    animationDuration:
                                    Duration(milliseconds: 1000),
                                    valueLabelPadding: const EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 8),
                                    valueLabelMargin:
                                    const EdgeInsets.only(right: 8),
                                    starOffColor: const Color(0xffe7e8ea),
                                    valueLabelColor: Colors.amber,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: MediaQuery.of(context).size.height*0.05,

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
                                      color: Colors.black26,fontSize: 18,fontWeight: FontWeight.w900
                                  ),),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
                              child: ElevatedButton(

                                child: Text("Follow"),
                                onPressed: _followButton,
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xF80687F6),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  alignment: Alignment(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Lorem Ipsum is simply dummylskngl saldgno hsgaols ISHIOQNGM SODG8OHLGN OSGAOLSNGIOLISGA OSGAILOGIOS OHALNGOSOWjilJDPJPSGMPSJAGOMOISJGOAGM SOIGOLSNAGL OSAGOSILANGOL agiosldnohasgoowr [sfhgonWLFPgf soghGDOOLANG FOAUHGHONGNSDGOH  gknsduigknglhilG OglnGHLHO text of the printing and typesetting industry.but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Table(
                            columnWidths: {0: FractionColumnWidth(.4)},
                            //  border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                Text('Condition',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                Text('Organic',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Price Type',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Fixed',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Category',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Beverages',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Location',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Kualalumpur, Malaysia',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                              ])
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Table(
                            //  border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                Text('Deleivery Details',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                Text(
                                  'Home Delivery Available, Cash On Delivery',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
          child: ElevatedButton(

            child: Text("Add To Cart"),
            onPressed: _addToCart,
            style: ElevatedButton.styleFrom(
              primary: Color(0xF80687F6),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ));
  }

  _addToCart() {
    print('add to cart');
    LocalStorage.productName=productName;
    Navigator.push(context, MaterialPageRoute(builder: (_)=>MyCartPage(productImage: widget.imageUrl,productName: productName,)));
  }

  void _backButton() {
    Navigator.pop(context);
  }

  void _followButton() {
  }

  void _wishList() {
  print('click on wish list');
  Navigator.push(context, MaterialPageRoute(builder: (_)=>WishListPage()));
  }
}

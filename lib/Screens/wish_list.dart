import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/product_detail.dart';
import 'package:ecommerce_flutter/utils/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/utils/group_list_view.dart';
import 'package:ecommerce_flutter/utils/app_color.dart';
import 'package:ecommerce_flutter/utils/listview.dart';

class WishListPage extends StatefulWidget {
/*  final categoryName;
  BrowsPage({
    this.categoryName,
  });*/
  @override
  _WishListPage createState() => _WishListPage();
}

class _WishListPage extends State<WishListPage> {
  _appBar(height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+30 ),
    child: Stack(
      children: <Widget>[

        Column(
          children: [

            Container(
              padding: EdgeInsets.only(top: 40),
             // height: MediaQuery.of(context).size.height*0.20,
              color: Color(0xFF19818E),
              child: Column(
                children: [
                  Row(

                    children: [
                      Row(
                        children: [

                          IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                         /*     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Home()));*/
                            },
                          )
                        ],
                      ),
                      SizedBox(width: 80,),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'WishList',
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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: _appBar(AppBar().preferredSize.height),
        body: SingleChildScrollView(
          child: Container(

            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 2),
              children: List.generate(imgList_chair.length, (index) {
                return Container(

                  // height: 600,
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
                                            color: Color(0xFF19818E),
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
                                          color: Color(0xFF19818E),
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
          ),
        ),
      ),
    ), onWillPop: () async{
      Navigator.pop(context);
      return true;
    });
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

  void onPressed() {
  }
}

import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/product_detail.dart';
import 'package:ecommerce_flutter/utils/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/utils/group_list_view.dart';
import 'package:ecommerce_flutter/utils/app_color.dart';
import 'package:ecommerce_flutter/utils/listview.dart';

class SearchProductFromStorePage extends StatefulWidget {
/*  final categoryName;
  BrowsPage({
    this.categoryName,
  });*/
  @override
  _SearchProductFromStorePage createState() => _SearchProductFromStorePage();
}

class _SearchProductFromStorePage extends State<SearchProductFromStorePage> {
  _appBar(height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+80 ),
    child: Stack(
      children: <Widget>[

        Column(
          children: [

            Container(
              padding: EdgeInsets.only(top: 40),
              height: 170,
              color: Color(0xFF19818E),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(
                        top: 14.0, left: 18.0, right: 8.0,bottom: 10),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            child: Icon(Icons.arrow_back_ios, color: Colors.white),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 5.0,left: 40),
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
                                  prefixIcon: Icon(Icons.search,color: Color(0xFF19818E),),
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
                    color:Color(0xFF19818E),
                    padding:EdgeInsets.only(left: 10,right: 10,top: 1,bottom: 1) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(

                            icon: const Icon(
                              Icons.sort,
                              color: Colors.white,
                            ),
                            onPressed: onPressed,
                            label: Text(
                              "Sort by",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF19818E)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            )
                        ),

                        ElevatedButton.icon(

                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            onPressed: onPressed,
                            label: Text(
                              "Location",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF19818E)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            )
                        ),

                        ElevatedButton.icon(

                            icon: const Icon(
                              Icons.view_comfortable,
                              color: Colors.white,
                            ),
                            onPressed: onPressed,
                            label: Text(
                              "Category",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF19818E)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            )
                        )
                      ],
                    ),
                  )
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
    return MaterialApp(
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
    );
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

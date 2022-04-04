import 'package:ecommerce_flutter/Models/store_model.dart';
import 'package:ecommerce_flutter/Profile/store_profile.dart';
import 'package:ecommerce_flutter/widgets/sub_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StorePage extends StatefulWidget{
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final double circleRadius = 120.0;
  bool isFollowed=false;
  var isDownloaded=false;
  List<Store> stores = [
    Store(id:1,imageUrl:    "assets/Twilio-SMS-Bot.jpg",name: "Alchemy Software Limited",totalProducts: 20,totalFollowers: 3000,location: 'Chittagong',category: 'IT',isFollow: true),
    Store(id:1,imageUrl:    "assets/programingName/chat-app.jpg",name: "Alchemy Software Limited",totalProducts: 20,totalFollowers: 3000,location: 'Chittagong',category: 'IT',isFollow: true),
    Store(id:1,imageUrl:    "assets/programingName/csharp.jpg",name: "Alchemy Software Limited",totalProducts: 20,totalFollowers: 3000,location: 'Chittagong',category: 'IT',isFollow: true),
    Store(id:1,imageUrl:    "assets/programingName/flutter.png",name: "Alchemy Software Limited",totalProducts: 20,totalFollowers: 3000,location: 'Chittagong',category: 'IT',isFollow: true),
    Store(id:1,imageUrl:    "assets/programingName/javascript.jpg",name: "Alchemy Software Limited",totalProducts: 20,totalFollowers: 3000,location: 'Chittagong',category: 'IT',isFollow: true),
    /* Category(id:2,imageUrl:  "assets/programingName/chat-app.jpg",  select: true,name: "Kenec",),
    Category(id:3,imageUrl:  "assets/programingName/csharp.jpg",    select: true,name: "Testi",),
    Category(id:4,imageUrl:  "assets/programingName/excel.jpg",     select: true,name: "Testi",),
    Category(id:5,imageUrl:  "assets/programingName/flutter.png",   select: true,name: "Bilai",),
    Category(id:6,imageUrl:  "assets/programingName/flutterapp.png",select: true,name: "Helpe",),
    Category(id:7,imageUrl:  "assets/programingName/html.jpg",      select: true,name: "Teste",),
    Category(id:8,imageUrl:  "assets/programingName/java.jpg",      select: true,name: "Teste",),
    Category(id:9,imageUrl:  "assets/programingName/javascript.jpg",select: true,name: "Teste",),
    Category(id:10,imageUrl: "assets/programingName/machine.png",   select: true,name: "Teste",),
    Category(id:11,imageUrl: "assets/programingName/mongodb.png",   select: true,name: "Teste",),
    Category(id:12,imageUrl: "assets/programingName/nodejs.png",    select: true,name: "Teste",),
    Category(id:13,imageUrl: "assets/programingName/php.jpg",       select: true,name: "Teste",),
    Category(id:14,imageUrl: "assets/programingName/posSystem.jpg", select: true,name: "Teste",),
    Category(id:15,imageUrl: "assets/programingName/pythonlogo.png",select: true,name: "Teste",),
    Category(id:16,imageUrl: "assets/programingName/reactjs.png",   select: true,name: "Teste",),

    Category(id:17,imageUrl: "assets/images/allCategories/beverage1.jpeg",select: true,name: "Beverage ",),
    Category(id:18,imageUrl: "assets/images/allCategories/seloon.jpg",select: true,name: "Seloon",),
    Category(id:19,imageUrl: "assets/images/allCategories/shoes_6.png",select: true,name: "Shoes",),
    Category(id:20,imageUrl: "assets/images/allCategories/vagetables.jpg",select: true,name: "Vagetable",),*/
  ];
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double y=MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(


          height:h*0.32,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: storeList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: h*0.30,
                    // height: double.infinity,
                    width: y*0.50,
                    //  width: double.infinity,
                    color: Color(0xffE0E0E0),
                    child: Stack(children: <Widget>[
                      Container(

                        height: MediaQuery.of(context).size.height / 2,
                        color: Colors.white,
                      ),
                      Container(

                        height: MediaQuery.of(context).size.height / 5,
                        color: Color(0xF80687F6),
                      ),
                      /*    Container(
                     color: Color(0xF80687F6),
                   ),*/

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[

                            Padding(
                              padding:
                              EdgeInsets.only(top: circleRadius / 2.0, ),  ///here we create space for the circle avatar to get ut of the box
                              child: Container(
                                height: h*0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8.0,
                                      offset: Offset(0.0, 5.0),
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                                    child: Column(
                                      children: <Widget>[

                                        SizedBox(height: circleRadius/2,),

                                        Text(i.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                                        Text(i.location, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.lightBlueAccent),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),

                                        SizedBox(
                                          height: h*0.01,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              //  ElevatedButton(onPressed: onPressed, child: Text('Follow'))
                                              ElevatedButton(
                                                child: i.isFollow==true?Text("Follow"):Text("Followed"),
                                                onPressed: () {

                                                  setState(() {

                                                    i.isFollow=!i.isFollow;
                                                  });
                                                  print("it's pressed follow");
                                                  print(i.isFollow);

                                                } ,
                                                style: ElevatedButton.styleFrom(
                                                  primary: i.isFollow==true?Color(0xF80687F6):Colors.black12,
                                                  onPrimary: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(32.0),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),

                            /*     Center(
               child: Image.network(
               "https://images.unsplash.com/photo-1526666923127-b2970f64b422",
               frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
               return child;
               },
               loadingBuilder: (context, child, loadingProgress) {
               if (loadingProgress == null) {
               return child;
               } else {
               return Center(
               child: CircularProgressIndicator(),
               );
               }})),*/
                            Container(

                              height: h*0.10,
                              width: double.infinity,
                             // color: Color(0xF80687F6),
                              color:Colors.white,
                              child: Image.asset(i.imageUrl,fit: BoxFit.cover,),

                            ),
                            ///Image Avatar
                            Padding(padding: EdgeInsets.only(top: 20),
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
                                    child:     Container(

                                      decoration: BoxDecoration(
                                     //   color: const Color(0xff7c94b6),
                                        image: DecorationImage(
                                          image: AssetImage(i.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all( Radius.circular(60.0)),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 4.0,
                                        ),
                                      ),
                                    ),

                                  ),
                                ),
                              ),),
                          ],
                        ),
                      ),
                    ]),
                  );
                  /*   Container(

             alignment: Alignment.center,
             width: 150.0,
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               clipBehavior: Clip.antiAlias,
               child: InkWell(
                 onTap: () {
                   print('Click Stores');
                   *//*          Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (_) => Products(imageUrl: i,)));*//*
                 },
                 child: Column(
                   crossAxisAlignment:
                   CrossAxisAlignment.start,
                   children: <Widget>[
                     Stack(
                       children: [

                         Align(
                          alignment: Alignment.center,
                           child: Container(
                             width: MediaQuery.of(context).size.width,
                             height: MediaQuery.of(context).size.height * 0.09,
                             //color: Colors.black,
                             child:Image.asset("assets/images/beverage9.jpg"),
                           ),
                         ),
                    Container(
                      padding: EdgeInsets.all(50),
                      alignment: Alignment.center,


                      child: Text('A',style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all()
                      ),
                    )

                       ],
                     )

                   ],
                 ),
               ),
             ),
           );*/
                },
              );
            }).toList(),
          ),
        ),


      ],
    );
  }

  void onPressed() {
  }
}
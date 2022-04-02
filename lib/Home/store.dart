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
                        color: Color(0xFF19818E),
                      ),
                      /*    Container(
                     color: Color(0xFF19818E),
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
                                                  primary: i.isFollow==true?Color(0xFF19818E):Colors.black12,
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
                             // color: Color(0xFF19818E),
                              color:Colors.white,
                            //  child: Image.asset("assets/Workshop-Banner-11.png",fit: BoxFit.cover,),
                              child: Image.asset("assets/images/banner-1.png",fit: BoxFit.cover,),

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
                                          //  image: AssetImage('assets/asl.png'),
                                            image: AssetImage('assets/images/ic_user_profile.png'),
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
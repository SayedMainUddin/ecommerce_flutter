
import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/TabPage.dart';
import 'package:ecommerce_flutter/Welcome/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPage createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {

int boarding=1;

  @override
  void initState() {
    boarding=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.40,
            decoration: BoxDecoration(

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xFF19818E),
                      Color(0xFF19818E),
                      Color(0xFF19818E),

                    ]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF19818E),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(
                                    11, 106, 83, 0.9019607843137255),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[


                          ],
                        ),
                      ),



                    ],
                  ),
                ),
                //SizedBox(height: 20),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              alignment: Alignment.center,
              child: new Container(
                alignment: Alignment.center,
                width: double.infinity,
               // height: MediaQuery.of(context).size.height*0.60,
                //height: MediaQuery.of(context).size.height*0.50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight:  Radius.circular(60),
                        topLeft:   Radius.circular(60)),

                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.60,
                              width: MediaQuery.of(context).size.width*0.79,
                              child: ClipRRect(

                                child:  boarding==1?Image.asset("assets/store.jpg",)
                                :boarding==2?Image.asset("assets/store1.png",):Image.asset("assets/store2.jpg",),
                              ),
                            ),

                            boarding==1?
                            Text('Empowering Artisans, \n Farmers & Micro Business',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.teal
                              ),
                              textAlign: TextAlign.center,
                            ):  boarding==2?  Text('Connecting NGOs, Social \n Enterprises With Communities',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.teal
                              ),
                              textAlign: TextAlign.center,
                            ): Text('Donate, Invest & Support \n Infrastructure projects',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.teal
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                Container(
                                  height: 10,
                                  width: 10,

                                  child: CircleAvatar(
                                    backgroundColor:boarding==1? Colors.green:Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 3,),
                                Container(
                                  height: 10,
                                  width: 10,
                                  child: CircleAvatar(
                                    backgroundColor: boarding==2?Colors.green: Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 3,),
                                Container(
                                  height: 10,
                                  width: 10,
                                  child: CircleAvatar(
                                    backgroundColor: boarding==3?Colors.green: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),


                      ],
                    ),

                  ],
                ),

              ),
            ),)
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: ElevatedButton(

          child: Text("Next",style: TextStyle(fontSize: 22)),
          onPressed:_nextButton,
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF146A76),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }



  void _nextButton() {
    boarding+=1;
    if( boarding==4){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
    };
    setState(() {
      boarding=boarding;
    });
    print(boarding);
  }
}

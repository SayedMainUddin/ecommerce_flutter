import 'dart:async';

import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/TabPage.dart';
import 'package:ecommerce_flutter/Welcome/onbording1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget{

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    Timer.run(() {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingPage()));

      });// import 'dart:async:

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Container(
      color:Colors.teal,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 300,
              child: ClipRRect(

                child:Image.asset('assets/asl.png',color: Colors.white),
              ),
            ),
          ),
          Container(
            child: Text('Tradly',style: TextStyle(color: Colors.white,fontSize: 22),),
          )
        ],
      )
  )
)
 ;
  }
}
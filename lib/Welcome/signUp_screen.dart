
import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/TabPage.dart';
import 'package:ecommerce_flutter/Welcome/sendOTP_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  TextEditingController emailController          = new TextEditingController();
  TextEditingController PasswordController          = new TextEditingController();



  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight:  Radius.circular(60)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xF80687F6),
                        Color(0xF80687F6),
                        Color(0xF80687F6),
                      ]
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80,),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(

                          onTap: (){

                                Navigator.pop(context);

                          },

                          child:   Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 22,
                            color: Colors.white,
                            semanticLabel: 'Back',
                          ),
                        ),
                        Text("SignUP", style: TextStyle(color: Colors.white, fontSize: 40),),
                        SizedBox(height: 10,),
                        Text("SignUp to your account", style: TextStyle(color: Colors.white, fontSize: 18),),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color:  Color(0xF80687F6),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color:  Color(0xFF1396A7),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color:
                                        Color(0xF80687F6)
                                    ))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "First Name",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color:
                                        Color(0xF80687F6)
                                    ))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color:
                                        Color(0xF80687F6)
                                    ))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color:
                                        Color(0xF80687F6)
                                    ))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color:
                                        Color(0xF80687F6)
                                    ))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Re-enter Password",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),



                        SizedBox(height: 40,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>OTPPage()));
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white
                            ),
                            child: Center(
                              child: Text("Create",
                                style: TextStyle(color: Color(0xF80687F6), fontWeight: FontWeight.bold,fontSize: 20),),
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                  //SizedBox(height: 20),

                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: 'Have an Account?',
                      ),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: ()=>_signUp(),
                child: Text('SignIn',   style: TextStyle(
                    fontSize: 18,
                    color: Color(0xF80687F6),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                ),),
              )
            ],
          )

      ),
    );
  }

  _signUp() {

     Navigator.push(context, MaterialPageRoute(builder: (_)=>OTPPage()));

  }
}

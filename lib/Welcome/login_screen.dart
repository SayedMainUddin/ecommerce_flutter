
import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/Welcome/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController          = new TextEditingController();
  TextEditingController PasswordController          = new TextEditingController();
/*  {
  "username": "sandippatil@gmail.com",
  "password": "Welcome@99"
  }*/
  String pass='Welcome@99';
  String email='sandippatil@gmail.com';


  login(String  pass,email) async {

    Map data = {
      "username":            email     ,
      "password":            pass,

    };
    print(data);
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    var url = await client
        .postUrl(Uri.parse("https://api.compiquest.com:8443/api/User/user/login"));
    /*var url =
    Uri.https('api.compiquest.com:8443', '/api/User/user/register', {'q': '{https}'});*/
    String body = json.encode(data);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(
      url.uri,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {

      print('success');
      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
    } else {
      print('error');
    }

  }


  @override
  void initState() {
    login( emailController.text=email,PasswordController.text=pass);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight:  Radius.circular(60)),
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
                SizedBox(height: 80,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 10,),
                      Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color:  Color(0xFF19818E),
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
                                      Colors.teal
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
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),

                      Text("Forgot Password?",
                        style: TextStyle(color: Colors.white),),
                      SizedBox(height: 40,),
                      InkWell(
                        onTap: (){
                     //     Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Text("LOGIN", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),),
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
                        text: 'If you don${"'"}t have an Account.',
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
                child: Text('Sign Up',   style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal,
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
   // login(pass, email);
     Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));

  }
}

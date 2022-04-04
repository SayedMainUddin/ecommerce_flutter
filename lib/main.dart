import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/TabPage.dart';
import 'package:ecommerce_flutter/Welcome/logo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const stripePublishableKey =  "pk_test_51KBzqmSDx3I7tpalrXOUhrHzKkB98gbEazVTQqKT5LW2ZGwH2cj4DxO0QypwIUwQtxiYpI8etXjHBJO5druQVq0P00la4HCGGb";
  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = stripePublishableKey;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LogoPage(),
     // home: HomePage(),
    );
  }
}



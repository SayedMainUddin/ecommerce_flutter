// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';



// payment_screen.dart
class StripePayment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: CardField(
          onCardChanged: (card) {
            print(card);
          },
        ),
      ),
    );
  }
}
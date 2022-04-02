import 'package:ecommerce_flutter/Home/home.dart';
import 'package:flutter/material.dart';


class CountryNameDisplayWidget extends StatelessWidget {
  final Country country;
  const CountryNameDisplayWidget(this.country, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          country.name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        ElevatedButton.icon(

            icon: const Icon(
              Icons.book,
              color: Colors.white,
            ),
            onPressed: onPressed,
            label: Text(
              "Start Shoping",
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
      ],
    );
  }

  void onPressed() {
  }
}

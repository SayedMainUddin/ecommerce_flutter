import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget{
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  _appBar(height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+60 ),
    child: Stack(
      children: <Widget>[

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height*0.10,
              color: Color(0xF80687F6),
              child: Column(
                children: [
                  Row(

                    children: [
                      Row(
                        children: [

                          IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                              /*    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Home()));*/
                            },
                          )
                        ],
                      ),
                      SizedBox(width: 50,),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Add a new address',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),


                ],
              ),
            ),

            InkWell(
              onTap: ()=>_userCurrentLocation(),
              child:  Container(
                padding: EdgeInsets.only(left: 100),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.05,
                child: Row(

                  children: [
                    Icon(Icons.album_outlined,color:Colors.cyan ),
                    Text('User current location',  style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            Divider(),

          ],
        )

      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar:_appBar(AppBar().preferredSize.height),
     body: SingleChildScrollView(

       child: Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
           child:
       Column(
         children: [
       TextFormField(
       autovalidateMode: AutovalidateMode.always,
       decoration: const InputDecoration(

         hintText: 'What is your name?',
         labelText: 'Name *',
       ),

     ),
           TextFormField(
             autovalidateMode: AutovalidateMode.always,
             decoration: const InputDecoration(

               hintText: 'What is your Phone No.?',
               labelText: 'Phone *',
             ),

           ),
           TextFormField(
             autovalidateMode: AutovalidateMode.always,
             decoration: const InputDecoration(

               hintText: 'What is your Street address?',
               labelText: 'Street address *',
             ),

           ),
           TextFormField(
             autovalidateMode: AutovalidateMode.always,
             decoration: const InputDecoration(

               hintText: 'What is your city name?',
               labelText: 'City *',
             ),

           ),
           TextFormField(
             autovalidateMode: AutovalidateMode.always,
             decoration: const InputDecoration(

               hintText: 'What is your Country name?',
               labelText: 'State *',
             ),

           ),
           TextFormField(
             autovalidateMode: AutovalidateMode.always,
             decoration: const InputDecoration(

               hintText: 'What is your Zip code?',
               labelText: 'ZipCode *',
             ),

           )
         ],
       )
       ),
     ),
       bottomNavigationBar: Padding(
         padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
         child: ElevatedButton(

           child: Text("Save",style: TextStyle(fontSize: 22)),
           onPressed: _saveAddress,
           style: ElevatedButton.styleFrom(
             primary: Color(0xF80687F6),
             onPrimary: Colors.white,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(32.0),
             ),
           ),
         ),
       ),
   );
  }

  void _userCurrentLocation() {
  }

  void _saveAddress() {
  }
}
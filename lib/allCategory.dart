import 'package:ecommerce_flutter/Models/category_model.dart';
import 'package:ecommerce_flutter/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/utils/group_list_view.dart';
import 'package:ecommerce_flutter/utils/app_color.dart';
import 'package:ecommerce_flutter/utils/listview.dart';
import 'package:flutter/cupertino.dart';

class AllFavouriteCategory extends StatefulWidget {
  final categoryName;
  AllFavouriteCategory({
    this.categoryName,
  });
  @override
  State<StatefulWidget> createState() {
    return _AllFavouriteCategoryState();
  }
}

class _AllFavouriteCategoryState extends State<AllFavouriteCategory> {
  List<Category> categories = [
    Category(id:1,imageUrl:  "assets/programingName/botpng.png",    select: true,name: "Bot",),
    Category(id:2,imageUrl:  "assets/programingName/chat-app.jpg",  select: true,name: "Chat",),
    Category(id:3,imageUrl:  "assets/programingName/csharp.jpg",    select: true,name: "Csharp",),
    Category(id:4,imageUrl:  "assets/programingName/excel.jpg",     select: true,name: "excel",),
    Category(id:5,imageUrl:  "assets/programingName/flutter.png",   select: true,name: "flutter",),
    Category(id:6,imageUrl:  "assets/programingName/flutterapp.png",select: true,name: "flutterapp",),
    Category(id:7,imageUrl:  "assets/programingName/html.jpg",      select: true,name: "html",),
    Category(id:8,imageUrl:  "assets/programingName/java.jpg",      select: true,name: "java",),
    Category(id:9,imageUrl:  "assets/programingName/javascript.jpg",select: true,name: "javascript",),
    Category(id:10,imageUrl: "assets/programingName/machine.png",   select: true,name: "machine",),
    Category(id:11,imageUrl: "assets/programingName/mongodb.png",   select: true,name: "mongodb",),
    Category(id:12,imageUrl: "assets/programingName/nodejs.png",    select: true,name: "nodejs",),
    Category(id:13,imageUrl: "assets/programingName/php.jpg",       select: true,name: "php",),
    Category(id:14,imageUrl: "assets/programingName/posSystem.jpg", select: true,name: "posSystem",),
    Category(id:15,imageUrl: "assets/programingName/pythonlogo.png",select: true,name: "pythonlogo",),
    Category(id:16,imageUrl: "assets/programingName/reactjs.png",   select: true,name: "reactjs",),

    Category(id:17,imageUrl: "assets/images/allCategories/beverage1.jpeg",select: true,name: "Beverage ",),
    Category(id:18,imageUrl: "assets/images/allCategories/seloon.jpg",select: true,name: "Seloon",),
    Category(id:19,imageUrl: "assets/images/allCategories/shoes_6.png",select: true,name: "Shoes",),
    Category(id:20,imageUrl: "assets/images/allCategories/vagetables.jpg",select: true,name: "Vagetable",),
  ];
  _appBar(height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+60 ),
    child: Column(
      children: <Widget>[
        Column(
          children: [

            Container(
              padding:EdgeInsets.only(left: 10,right: 50,top: 40,bottom: 1) ,
              // Background
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        //  LocalStorage.productName=widget.productName;
                      });

                      Navigator.pop(context);
/*                                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage(pageIndex: 0,)));*/
                    },
                  ),
                  Center(
                    child: Text(widget.categoryName, style: TextStyle(fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),),
                  Container()
                ],
              ),
              color:Color(0xFF19818E),
              height: height+40,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color:Color(0xFF19818E),
              padding:EdgeInsets.only(left: 10,right: 10,top: 1,bottom: 1) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(

                      icon: const Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                      onPressed: onPressed,
                      label: Text(
                        "Sort by",
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

                  ElevatedButton.icon(

                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      onPressed: onPressed,
                      label: Text(
                        "Location",
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

                  ElevatedButton.icon(

                      icon: const Icon(
                        Icons.view_comfortable,
                        color: Colors.white,
                      ),
                      onPressed: onPressed,
                      label: Text(
                        "Category",
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
                  )
                ],
              ),
            )
          ],
        )

      ],
    ),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: _appBar(AppBar().preferredSize.height),
        body: SingleChildScrollView(
          child: Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
              children: List.generate(categories.length, (index) {
                return Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card tapped.');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Products(
                                  imageUrl: categories[index].imageUrl,
                                )));
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              categories[index].imageUrl,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 20,
                              width: 200,
                              alignment: Alignment.center,
                              color:Colors.red,
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  final List<String> imgList_chair = [
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair1.png",
  ];

  final List<String> imgList_beverage = [
    "assets/images/beverage1.jpeg",
    "assets/images/beverage2.png",
    "assets/images/beverage3.jpg",
    "assets/images/beverage4.jpg",
    "assets/images/beverage5.jpg",
    "assets/images/beverage6.jpg",
    "assets/images/beverage7.jpg",
    "assets/images/beverage8.jpg",
    "assets/images/beverage9.jpg",
    "assets/images/beverage10.jpg",
  ];

  void onPressed() {
  }
}


class AllContact extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AllContact();
  }
}

class _AllContact extends State<AllContact>{
 

  @override
  void initState() {


    super.initState();


  }
  Widget _buildButton(String name, IconData icon, Function onPress){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          primary: Colors.white,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: _onPress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Color(0xFF527DAA),
            ),
            SizedBox(width: 10,),
            Text(
              name,
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(child:  Scaffold(
        backgroundColor: Color(0xfff4f4f9),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Text(

                'All Contacts',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          backgroundColor: Color(0xff8ededfb),
        ),

        body: Stack(
          children: [
         
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Color(0xfff4f4f9),
                    child: Column(
                      children: [
                        _buildButton(
                            'New Contact',
                            Icons.person_add_alt_1_rounded,
                                (){
                         
                              print('clicked New Contact');
                            }
                        ),
                        _buildButton(
                            'Pending Contact',
                            Icons.pending_actions_outlined,
                                (){
                              print('clicked Pending Contact');
                       
                            }
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 15,
                              left: 10
                          ),
                          child: Row(
                            children: [
                              Text(
                                "My Contacts",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                              SizedBox(width: 5,),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 28,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Divider(
                  //   thickness: 1,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ), onWillPop: () async {
    return true;
      });

  }

/*  void _runFilter(String enteredKeyword) {
    List<User> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allFriendWithoutGrrp;
    } else {
      results = allFriendWithoutGrrp.where((user) =>
          user.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      allFriendWithoutGrrp = results;
    });
  }*/



  void _onPress() {
  }
}


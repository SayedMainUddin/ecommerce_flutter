
import 'package:ecommerce_flutter/Models/category_model.dart';
import 'package:ecommerce_flutter/allCategory.dart';
import 'package:flutter/material.dart';


class Categorise extends StatefulWidget {

  @override
  _CategoriseState createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
  List<Category> categories = [
    Category(id:1,imageUrl: "assets/images/allCategories/beverage1.jpeg",select: true,name: "Beverage ",),
    Category(id:2,imageUrl: "assets/images/allCategories/seloon.jpg",select: true,name: "Seloon",),
    Category(id:3,imageUrl: "assets/images/allCategories/shoes_6.png",select: true,name: "Shoes",),
    Category(id:4,imageUrl: "assets/images/allCategories/vagetables.jpg",select: true,name: "Vagetable",),
    Category(id:5,imageUrl: "assets/images/shoes_1.png",select: true,name: "Somsh",),
    Category(id:6,imageUrl: "assets/images/shoes_1.png",select: true,name: "Kenec",),
    Category(id:7,imageUrl: "assets/images/shoes_1.png",select: true,name: "Testi",),
    Category(id:8,imageUrl: "assets/images/shoes_1.png",select: true,name: "Testi",),
    Category(id:9,imageUrl: "assets/images/shoes_1.png",select: true,name: "Bilai",),
    Category(id:10,imageUrl: "assets/images/shoes_1.png",select: true,name: "Helpe",),
    Category(id:11,imageUrl: "assets/images/shoes_1.png",select: true,name: "Teste",),
    Category(id:12,imageUrl: "assets/images/shoes_1.png",select: true,name: "Teste",),
    Category(id:13,imageUrl: "assets/images/shoes_1.png",select: true,name: "Teste",),
    Category(id:14,imageUrl: "assets/images/shoes_1.png",select: true,name: "Teste",),
    Category(id:15,imageUrl: "assets/images/shoes_1.png",select: true,name: "Teste",),
  ];
   List<Category> allCategory=[];
  @override
  void initState() {
    allCategory=categories;
    super.initState();
  }
  final List<String> imgList = [
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair2.png",
    "assets/images/ic_chair4.png",
    "assets/images/shoes_1.png",
    "assets/images/shoes_2.png",
    "assets/images/shoes_3.png",
    "assets/images/ic_table.png",
    "assets/images/ic_table1.png",
    "assets/images/beverage1.jpeg",


  ];
  _appBar(height) =>
      PreferredSize(
        preferredSize:  Size(MediaQuery
            .of(context).size.width, height + 100),
        child: Container(
          color: Color(0xFF19818E),
          padding:EdgeInsets.fromLTRB(10, 50, 10, 10) ,
          child: Stack(
            children: <Widget>[


              Container(
                // height: 70.0,
                margin: EdgeInsets.only(bottom: 1.0),
                padding: EdgeInsets.fromLTRB( 10,5,5,14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  color: Color(0xFF19818E),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0,
                    ),
                  ],
                ),

                child: Column(

                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),

                            child: InkWell(

                              onTap: (){
                            Navigator.pop(context);


                              },

                              child:   Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0.0),
                          padding: EdgeInsets.fromLTRB( 20,5,5,4),
                          alignment: Alignment.center,
                          child: Text('All Category',
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                        ),
                      ],
                    ),

                    Container(

                      color:Color(0xFF19818E),
                      padding:EdgeInsets.only(left: 0,right: 0,top: 20,bottom: 1) ,
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
                    ),
                  ],
                ),
              ),
            ],




          ),
        ),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(AppBar().preferredSize.height),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Container(
            child: GridView.count(
              shrinkWrap: true,

              crossAxisCount: 2,
              padding: EdgeInsets.only(
                  top: 8, left: 6, right: 6, bottom: 12),
              children: List.generate(allCategory.length, (index) {
                return Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                      var categoryName=allCategory[index].name;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>AllFavouriteCategory(categoryName: categoryName,)));
                        print('Card tapped.');
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              allCategory[index].imageUrl,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                allCategory[index].name,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }

  void onPressed() {
  }
}

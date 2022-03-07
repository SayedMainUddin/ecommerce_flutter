import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/allCategory.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/categorise.dart';
import 'slider.dart';
import 'package:favorite_button/favorite_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    "assets/images/ic_chair1.png",
    "assets/images/ic_chair2.png",
    "assets/images/ic_chair.png",
    "assets/images/ic_chair4.png",
    "assets/images/shoes_1.png",
    "assets/images/shoes_2.png",
    "assets/images/shoes_3.png",
    "assets/images/shoes_4.png",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(

            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 200,
                          color: Colors.teal,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'Groceries',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      FavoriteButton(
                                        iconSize: 20,
                                        isFavorite: true,
                                        // iconDisabledColor: Colors.white,
                                        valueChanged: (_isFavorite) {
                                          print('Is Favorite : $_isFavorite');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.shopping_cart),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => CartPage()));
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 14.0, left: 8.0, right: 8.0),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5.0),
                                          child: TextFormField(
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                gapPadding: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: BorderSide(
                                                  color: Colors.black87,
                                                  width: 1.0,
                                                ),
                                              ),
                                              hintText: 'Search Product',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                gapPadding: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: BorderSide(
                                                  color: Colors.black87,
                                                  width: 1.0,
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.search),
                                              filled: true,
                                              contentPadding: EdgeInsets.only(
                                                left: 15.0,
                                                top: 0.0,
                                                bottom: 0.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: 240.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: imgList.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: 250.0,
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: InkWell(
                                        onTap: () {
                                          print('Click products');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => Products(imageUrl: i,)));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 150,
                                                  width: 200,
                                                  child: Hero(
                                                    tag: '$i',
                                                    child: Image.asset(i
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  padding: EdgeInsets.all(50),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Text Message',
                                                      style: TextStyle(
                                                          color: Colors.deepOrange,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22.0),
                                                    )),
                                              ],
                                            ),
                                            ListTile(
                                              title: Text(
                                                'Two Gold Rings',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              subtitle: Text('\$200',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 6.0, left: 8.0, right: 8.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/banner-1.png'),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Text('Shop By Category',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 8.0, left: 8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor),
                                  child: Text('View All',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Categorise()));
                                  }),
                            )
                          ],
                        ),
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            padding: EdgeInsets.only(
                                top: 8, left: 6, right: 6, bottom: 12),
                            children: List.generate(4, (index) {
                              return Container(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      print('Card tapped.');
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            imgList[index],
                                            height: 250,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Text Message',
                                              style: TextStyle(
                                                  color: Colors.white,
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
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/banner-2.png'),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Text('Favourite Iteams',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 8.0, left: 8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor),
                                  child: Text('View All',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AllFavouriteCategory()));
                                  }),
                            )
                          ],
                        ),
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            padding: EdgeInsets.only(
                                top: 8, left: 6, right: 6, bottom: 12),
                            children: List.generate(4, (index) {
                              return Container(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      print('Card tapped.');
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            imgList[index],
                                            height: 250,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Text Message',
                                              style: TextStyle(
                                                  color: Colors.white,
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
                        ),
                      ],
                    ),
                  ),

                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              ),

            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 35,
            ),
            label: "Browse",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront,
              size: 35,
              // color:  Colors.grey,
            ),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt,size: 35,),
            label: "Order History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,size: 35,),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex);
          });
        },
      ),
    );
  }

  int _selectedIndex = 0;
}

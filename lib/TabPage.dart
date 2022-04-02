
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flutter/Home/home.dart';
import 'package:ecommerce_flutter/Profile/store_profile.dart';
import 'package:ecommerce_flutter/Profile/user_profile.dart';
import 'package:ecommerce_flutter/Screens/brows.dart';
import 'package:ecommerce_flutter/Store/create_store.dart';
import 'package:ecommerce_flutter/allCategory.dart';
import 'package:ecommerce_flutter/cart/cart_in_memory_repository.dart';
import 'package:ecommerce_flutter/cart/order_history.dart';
import 'package:ecommerce_flutter/product_detail.dart';
import 'package:ecommerce_flutter/utils/bottomNavBarDesign.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/categorise.dart';
import 'dart:ui';
import 'package:ecommerce_flutter/utils/favourite_button.dart';

class HomePage extends StatefulWidget {
  final pageIndex;
  HomePage({
    this.pageIndex
});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  PageController? _pageController;
  int _pageIndex = 0;

  List<Widget> tabPages = [
    Home(),
    BrowsPage(),
    CreateStorePage(),
    OrderHistoryPage(),
   // Categorise(),
    UserProfilePage()

  ];

  initState()  {
if(widget.pageIndex==0 || widget.pageIndex==null){
  _pageIndex = 0;
}else{
  _pageIndex = widget.pageIndex;
}

    _pageController = PageController(initialPage: _pageIndex);
  }
  void onPageChanged(int page) {
    if(page==0){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
    }

    print('click on pageTab');
    setState(() {
      this._pageIndex = page;
    });
  }
  /*void onPageChanged(int page) {
  if(page==0){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));
    }



   // searchControllerInrecent.clear();
    print('click on pageTab');
    setState(() {
      this._pageIndex = page;
    });
  }*/
  void onTabTapped(int index) {

    this._pageController!.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(child: Scaffold(
      body:
      PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      bottomNavigationBar:
      /*    FABBottomAppBar(

        color: Colors.blueGrey,
        backgroundColor: Colors.white,
        selectedColor: Colors.blue.withOpacity(0.70),

        onTabSelected: onTabTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.chat, text: 'Chats'),
          FABBottomAppBarItem(iconData: Icons.call, text: 'Calls'),
          FABBottomAppBarItem(iconData: Icons.contacts_rounded, text: 'Contacts'),
          FABBottomAppBarItem(iconData: Icons.notifications, text: 'Notifica..'),
        ],
      ),*/

      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
        currentIndex: _pageIndex,
        selectedItemColor: Color(0xFF19818E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          onTabTapped(index);
          /*        setState(() {
            _pageIndex = index;
       if(_pageIndex==1){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>BrowsPage()));
            }

            print(_pageIndex);
          });*/
        },
      ),
    ), onWillPop: () async => false);
  }


}

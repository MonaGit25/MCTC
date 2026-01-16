import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'requisition_page.dart';
import 'shop_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
    RequisitionPage(
      goToShopTab: () => navigateBottomBar(1),
    ),
      ShopPage(
        goToRequisitionTab: () => navigateBottomBar(0),
      ),
      CartPage(),
    ];
  }

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
            onTap: navigateBottomBar,
            unselectedItemColor: Colors.white,
            selectedItemColor: Color(0xFFDE7311),
            items: const [
              BottomNavigationBarItem(icon: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(Icons.home),
              ), label: 'Home'),
              BottomNavigationBarItem(icon: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(Icons.store),
              ), label: 'Requisitions'),
              BottomNavigationBarItem(icon: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(Icons.shopping_cart),
              ), label: 'Provisions'),
            ]
        ),
      ),
      // bottomNavigationBar: MyBottomNavbar(
      //   onTabChange: (index) => navigateBottomBar(index),
      // ),
    );
  }
}


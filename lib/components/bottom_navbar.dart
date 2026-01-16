import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        padding: const EdgeInsets.all(24.0),
        backgroundColor: Colors.black ,
        color: Colors.white,
          activeColor: Color(0xFFDE7311),

          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              icon: Icons.home , text: 'Home'),
            GButton(
              icon: Icons.store, text: 'Requisitions'),
            GButton(
              icon: Icons.shopping_cart, text: 'Provisions',)
          ]
      ),
    );
  }
}

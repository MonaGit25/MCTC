import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  final String items;
  // const ItemsList({super.key});
  ItemsList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 350,
        color: Colors.blue,
      ),
    );
  }
}

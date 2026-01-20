import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final VoidCallback goToShopTab;

  const CartPage({
    super.key,
    required this.goToShopTab,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Cart"));
  }
}

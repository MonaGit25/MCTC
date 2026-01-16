import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcomApp());
}

class EcomApp extends StatelessWidget {
  const EcomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}

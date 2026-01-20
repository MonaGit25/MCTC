import 'package:flutter/material.dart';

class ProvisionPage extends StatefulWidget {
  final VoidCallback goToShopTab;

  const ProvisionPage({
    super.key,
    required this.goToShopTab,
  });

  @override
  State<ProvisionPage> createState() => _ProvisionPageState();
}

class _ProvisionPageState extends State<ProvisionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xF2F3F6FF),
        appBar: AppBar(
          title: const Text("Shop"),
          backgroundColor: const Color(0xF2F3F6FF),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: widget.goToShopTab,
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Provision Store",
              style: TextStyle(fontSize: 26, color: Color(0xFFD97A1D),fontWeight: FontWeight.w600),
            ),
            const Text(
              "Browse and add items for delivery",
              style: TextStyle(fontSize: 15, color: Color(0xFF939393), fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 32),
            const SearchBar(
            ),
          ],
        ),
      ),
    );
  }
}

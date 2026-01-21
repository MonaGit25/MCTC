import 'package:ecommerce_app/components/item_list.dart';
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

// Search bar
class CustomSearchDelegate extends SearchDelegate {
  final List<String> data = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Pineapple"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(results[index]));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
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
            const SizedBox(height: 32),SizedBox( height: 50,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0x80DDDDDD),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.search,
                      color: Color(0xFF939393),
                    ),
                    padding: EdgeInsets.zero, // 🔥 important
                    constraints: const BoxConstraints(), // 🔥 removes extra space
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                ItemsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

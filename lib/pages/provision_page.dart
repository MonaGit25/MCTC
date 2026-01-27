import 'package:ecommerce_app/components/item_catalog.dart';
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
class Category {
  final String title;
  final String image;

  Category({required this.title, required this.image});
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
  final List<String> _things =
  List.generate(4, (index) => 'Type ${index + 1}');

  final List<Category> _types = [
    Category(title: 'Bakery', image: 'lib/images/bakery.png'),
    Category(title: 'Meat', image: 'lib/images/beef.png'),
    Category(title: 'Perishables', image: 'lib/images/bun.png'),
  ];

  // final List<String> _types =
  // List.generate(4, (index) => 'Type ${index + 1}');

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Provision Store",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD97A1D),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Browse and add items for delivery"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search items",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 70, // slightly bigger than item height
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _types.length,
                itemBuilder: (context, index) {
                  return ItemTypes(
                    title: _types[index].title,
                    image: _types[index].image,
                  );
                },
              ),
            ),

            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _things.length,
                itemBuilder: (context, index) {
                  return ItemsList(items: _things[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

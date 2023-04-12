import 'package:flutter/material.dart';

import '../components/item_card.dart';
import '../components/top_bar.dart';

class SearchPage extends StatefulWidget {
  //const List<Map<String, Object>> books = [];

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TopBar(),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  //prefixIcon: const Icon(Icons.search_outlined),
                  hintText: 'Search Books here..',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search_outlined, color: Colors.blue),
                    onPressed: () => _searchController.clear(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ItemCard(),
            ],
          ),
        ));
  }
}

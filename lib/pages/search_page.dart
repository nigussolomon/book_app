import 'package:flutter/material.dart';

import '../components/item_card.dart';
import '../components/top_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/bloc/search_bloc.dart';
import 'package:book_app/bloc/search_state.dart';
import 'package:book_app/bloc/search_event.dart';

class SearchPage extends StatefulWidget {
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
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchInitialState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  searchText(_searchController, context),
                  const SizedBox(
                    height: 10,
                  ),
                  //ItemCard(items: state.books),
                ],
              ),
            );
          } else if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchSuccessState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  searchText(_searchController, context),
                  const SizedBox(
                    height: 10,
                  ),
                  ItemCard(items: state.books),
                ],
              ),
            );
          } else if (state is SearchErrorState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Text("something went wrong"));
          }
        },
      ),
    );
  }
}

Widget searchText(
    TextEditingController searchController, BuildContext context) {
  return TextField(
    controller: searchController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      hintText: 'Search Books here..',
      suffixIcon: IconButton(
        icon: const Icon(Icons.search_outlined, color: Colors.blue),
        onPressed: () {
          context
              .read<SearchBloc>()
              .add(SubmitSearchEvent(searchController.text));
          //searchController.clear()
        },
      ),
    ),
  );
}

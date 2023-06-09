import 'package:book_app/components/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../bloc/favorites_bloc.dart';
import '../components/item_card.dart';
import '../components/top_bar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesInitial) {
            BlocProvider.of<FavoritesBloc>(context).add(FavoritesFetchEvent());
          }
          if (state is FavoritesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavoritesSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocaleText(
                    "favourites",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomBar(index: 2),
    );
  }
}

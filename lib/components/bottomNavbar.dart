import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/download_bloc.dart';
import '../resources/routes.dart';

class BottomBar extends StatefulWidget {
  final int index;
  const BottomBar({super.key, required this.index});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List routes = [
    Routes.home,
    Routes.searchResult,
    Routes.downloadHistory,
    Routes.favourites
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.popAndPushNamed(context, routes[index]);
      if (index == 1) {
        BlocProvider.of<DownloadBloc>(context).add(History());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.index;
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 50,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favourites',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}

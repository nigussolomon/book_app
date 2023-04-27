import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
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

  List routes = [Routes.home, Routes.downloadHistory, Routes.favourites];

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
    return DotNavigationBar(
      boxShadow: const [
        BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(1, 1))
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      // dotIndicatorColor: Colors.black,
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
          selectedColor: Colors.blueAccent,
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.download_rounded),
          selectedColor: Colors.grey,
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.favorite),
          selectedColor: Colors.red,
        ),
      ],
    );
  }
}

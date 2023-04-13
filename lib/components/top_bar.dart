import 'package:flutter/material.dart';

import '../resources/routes.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: const Text(
        "BOOK APP",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.profile);
          },
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

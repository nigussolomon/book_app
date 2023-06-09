import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../bloc/book_bloc.dart';
import '../resources/routes.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.book),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: Transform.translate(
        offset: const Offset(-25.0, 0.0),
        child: const LocaleText(
          "bookapp",
          style: TextStyle(color: Colors.black),
        ),
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
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<BookBloc>(context).add(const BookFetchEvent());
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.language);
          },
          icon: const Icon(
            Icons.language,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

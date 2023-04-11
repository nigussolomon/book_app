import 'package:book_app/pages/download_history.dart';
import 'package:book_app/pages/favorites_page.dart';
import 'package:book_app/pages/profile.dart';
import 'package:book_app/pages/search_page.dart';
import 'package:book_app/pages/signin.dart';
import 'package:book_app/pages/signup.dart';
import 'package:book_app/resources/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      routes: {
        Routes.signup: (context) => const Signup(),
        Routes.signin: (context) => const Signin(),
        Routes.home: (context) => const Home(),
        Routes.profile: (context) => const ProfilePage(),
        Routes.downloadHistory: (context) => const DownloadHistoryPage(),
        Routes.favourites: (context) => const FavoritesPage(),
        Routes.searchResult: (context) => const SearchPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (BuildContext context) => const Signup(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 190),
        color: Color.fromARGB(255, 89, 173, 250),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              // Image(image: AssetImage('assets/Book.svg')),
              SvgPicture.asset(
                "assets/Book.svg",
                color: Colors.white,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "BOOK APP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                "by AKNY",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("data"),
    ),
  );
}

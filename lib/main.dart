import 'package:book_app/pages/download_history.dart';
import 'package:book_app/pages/profile.dart';
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
      initialRoute: Routes.signup,
      routes: {
        Routes.signup: (context) => const Signup(),
        Routes.signin: (context) => const Signin(),
        Routes.home: (context) => const Home(),
        Routes.profile: (context) => const ProfilePage(),
        Routes.downloadHistory: (context) => const DownloadHistoryPage()
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
    );
  }
}

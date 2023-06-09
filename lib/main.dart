import 'package:book_app/bloc/book_bloc.dart';
import 'package:book_app/bloc/download_bloc.dart';
import 'package:book_app/bloc/favorites_bloc.dart';
import 'package:book_app/bloc/search_bloc.dart';
import 'package:book_app/pages/Home.dart';
import 'package:book_app/pages/download_history.dart';
import 'package:book_app/pages/favorites_page.dart';
import 'package:book_app/pages/languages.dart';
import 'package:book_app/pages/profile.dart';
import 'package:book_app/pages/search_page.dart';
import 'package:book_app/pages/signin.dart';
import 'package:book_app/pages/signup.dart';
import 'package:book_app/resources/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';

import 'auth_check.dart';
import 'pages/add_book.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'am']);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // get book => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookBloc(),
        ),
        BlocProvider(
          create: (context) => DownloadBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(),
        )
      ],
      child: LocaleBuilder(
        builder: (locale) => MaterialApp(
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          initialRoute: 'splash',
          routes: {
            'splash': (context) => const Home(),
            Routes.signup: (context) => const Signup(),
            Routes.signin: (context) => const Signin(),
            Routes.home: (context) => HomePage(),
            Routes.profile: (context) => const ProfilePage(),
            Routes.downloadHistory: (context) => const DownloadHistoryPage(),
            Routes.favourites: (context) => const FavoritesPage(),
            Routes.addBook: (context) => const AddBook(),
            Routes.language: (context) => const languageScreen(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
        ),
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
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (BuildContext context) => const AuthCheck(),
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
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/Book.svg",
                  color: Colors.white,
                  height: 120,
                  width: 120,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:book_app/main.dart';
import 'package:book_app/pages/Home.dart';
import 'package:book_app/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    Stream<User?> authStateChanges = _firebaseAuth.authStateChanges();
    return StreamBuilder(
      stream: authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const Signin();
        }
      },
    );
  }
}

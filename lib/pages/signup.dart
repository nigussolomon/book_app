import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passwordVisible = false;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 100,
              ),
              const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(7, 7))),
                      hintText: 'Enter your name',
                      labelText: "Username"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(7, 7))),
                      hintText: 'Enter your email',
                      labelText: "Email"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: passwordController,
                  obscureText: passwordVisible,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(7, 7))),
                    hintText: 'Choose a Password',
                    labelText: "Password",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(7, 7))),
                      hintText: 'Confirm your password',
                      labelText: "Confirmation",
                    )),
              ),
              Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        Navigator.of(context).pushNamed('/');
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 91, 180, 253)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ))),
                    child: const Text("SIGN UP"),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                      child: const Text("Sign in"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

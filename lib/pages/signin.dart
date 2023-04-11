import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool passwordVisible = false;

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
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: SvgPicture.asset(
                "assets/Book.svg",
                width: 100,
                height: 100,
              )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign in",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(25, 25))),
                      hintText: 'Enter your name',
                      labelText: "Name"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(25, 25))),
                    hintText: 'Choose a Password',
                    labelText: "Password",
                    helperText:
                        "Password must contain atleast 8 special character",
                    helperStyle: const TextStyle(color: Colors.lightBlue),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                ),
              ),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    child: const Text("Continue"),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Doesn't have an account? "),
                  TextButton(onPressed: () {}, child: const Text("Sign up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

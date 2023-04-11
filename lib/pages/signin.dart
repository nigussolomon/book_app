import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SIGN IN",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(7, 7))),
                    hintText: 'Enter your name',
                    labelText: "Name"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                obscureText: passwordVisible,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(7, 7))),
                  hintText: 'Choose a Password',
                  labelText: "Password",
                ),
              ),
            ),
            Container(
                height: 90,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 91, 180, 253)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
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
    );
  }
}

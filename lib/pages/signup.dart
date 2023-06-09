import 'dart:io';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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

  File _image = File('');
  final _picker = ImagePicker();

  Future<void> pickUploadProfilePic(
    ImageSource source,
  ) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _image = File(image.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Center(
                child: Stack(
                  children: [
                    _image.path != ''
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.file(_image).image)),
                          )
                        : const CircleAvatar(
                            radius: 80,
                            child: Icon(
                              Icons.person,
                              size: 100,
                            ),
                          ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  pickUploadProfilePic(
                                                      ImageSource.gallery);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.image,
                                              )),
                                          Text("GALLERY")
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  pickUploadProfilePic(
                                                      ImageSource.camera);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.camera,
                                              )),
                                          Text("CAMERA")
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.camera_enhance, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        Fluttertoast.showToast(
                            msg: error.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
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

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/top_bar.dart';
import '../data/Api_service.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController note = TextEditingController();
  final TextEditingController desc = TextEditingController();
  FilePickerResult? result;
  FilePickerResult? img;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final User? _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(137, 43, 43, 43)),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(5, 5))),
              child: TextField(
                controller: note,
                decoration: const InputDecoration(
                    hintText: "Title", border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(5, 5))),
                  child: Column(
                    children: [
                      const Text("Selected PDF"),
                      Text(result?.files[0].name ?? '',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () async {
                            result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result == null) {
                              print("No file selected");
                            } else {
                              setState(() {});
                              result?.files.forEach((element) {
                                print(element.name);
                              });
                            }
                          },
                          icon: const Icon(Icons.upload_file)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(5, 5))),
                  child: Column(
                    children: [
                      const Text("Selected Image"),
                      Text(img?.files[0].name ?? '',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () async {
                            img = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (img == null) {
                              print("No file selected");
                            } else {
                              setState(() {});
                              img?.files.forEach((element) {
                                print(element.name);
                              });
                            }
                          },
                          icon: const Icon(Icons.upload)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(137, 43, 43, 43)),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(5, 5))),
              child: TextField(
                controller: desc,
                decoration: const InputDecoration(
                    hintText: "Description", border: OutlineInputBorder()),
                maxLines: 7,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      final res = await Service.uploadbook(
                        result!.files[0].path,
                        note.text,
                        _user!.email!.split('@')[0],
                        desc.text,
                        img!.files[0].path,
                      ).then((value) => {
                            print("hhh" + value),
                            if (value['detail'] == null)
                              {
                                setState(() {
                                  isLoading = false;
                                }),
                                Fluttertoast.showToast(
                                    msg: "SUCCESS",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0),
                              }
                            else
                              {
                                setState(() {
                                  isLoading = false;
                                })
                              }
                          });
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "Something went wrong!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 91, 180, 253)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ))),
                  child:
                      isLoading ? CircularProgressIndicator() : Text('SIGN IN'),
                )),
          ],
        ),
      )),
    );
  }
}

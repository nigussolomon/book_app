import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/top_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('History Page'),
    Text('Favourites Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.e4DxCtL1DoJQ3EZRiSvL6wHaEK?w=259&h=180&c=7&r=0&o=5&pid=1.7"))),
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 30),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://th.bing.com/th/id/OIP.IoUmyjrf4VaXudyiVqv2WwHaII?w=201&h=220&c=7&r=0&o=5&pid=1.7"))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "username",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
                const Text(
                  "someone@example.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .65, 50)),
                  child: const Text("DELETE ACCOUNT"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .2, 50)),
                  child: const Text("ADD BOOK"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

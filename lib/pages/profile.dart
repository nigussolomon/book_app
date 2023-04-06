import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "BOOK APP",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .06,
                  child: const Center(
                    child: Text(
                      "someone@example.com",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .06,
                  child: const Center(
                    child: Text(
                      "+251 965432118",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
              child: const Text("PUBLISH A BOOK"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dasboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DownloadHistoryPage extends StatefulWidget {
  const DownloadHistoryPage({super.key});

  @override
  State<DownloadHistoryPage> createState() => _DownloadHistoryPageState();
}

class _DownloadHistoryPageState extends State<DownloadHistoryPage> {
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
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        child: ListView.builder(
          itemCount: 13,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.4zygV7JXARRma1FeXBTxtgAAAA?w=197&h=315&c=7&r=0&o=5&pid=1.7"))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Book Title",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Book Author",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Text(
                              "Lorem ipsum dolor sit amet consectetur. Imperdiet in turpis netus enim aliquam nullam nunc. "),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          },
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

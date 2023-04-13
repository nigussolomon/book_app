import 'package:book_app/components/bottomNavbar.dart';
import 'package:flutter/material.dart';

import '../components/item_card.dart';
import '../components/top_bar.dart';

class DownloadHistoryPage extends StatefulWidget {
  const DownloadHistoryPage({super.key});

  @override
  State<DownloadHistoryPage> createState() => _DownloadHistoryPageState();
}

class _DownloadHistoryPageState extends State<DownloadHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Downloads",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            ItemCard()
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(
        index: 1,
      ),
    );
  }
}

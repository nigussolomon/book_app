import 'package:book_app/components/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/download_bloc.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: BlocBuilder<DownloadBloc, DownloadState>(
        builder: (context, state) {
          if (state is DownloadInitial) {
            BlocProvider.of<DownloadBloc>(context).add(History());
          }
          if (state is DownloadSuccess) {
            print(state.history);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Downloads",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: size.width,
                      child: ListView.builder(
                          itemCount: state.history.length,
                          itemBuilder: (context, index) {
                            final his = state.history[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Hero(
                                        tag: "book tag $index",
                                        child: Image.network(
                                          "https://book-api-lksx.onrender.com/images/${his['id']}",
                                          fit: BoxFit.cover,
                                          width: 80,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                his["bookname"],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(his["author_name"],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          Text(
                                            his['description'],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            );
                          }),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomBar(
        index: 1,
      ),
    );
  }
}

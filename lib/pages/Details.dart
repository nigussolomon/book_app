import 'dart:io';

import 'package:book_app/pages/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../bloc/download_bloc.dart';
import '../components/top_bar.dart';
import '../data/Api_service.dart';
import '../data/book.dart';
import 'Home.dart';

class DetailsScreen extends StatelessWidget {
  final Book book21;
  const DetailsScreen({Key? key, required this.book21}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DownloadBloc>(context).add(CheckDownload(book: book21));
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TopBar(),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black54, BlendMode.darken),
                        image: NetworkImage(
                            "https://book-api-b.onrender.com/images/${book21.id}"),
                      )),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://book-api-b.onrender.com/images/${book21.id}"),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  book21.bookName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  book21.desc,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 50),
                          backgroundColor: Colors.red),
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("LIKE"),
                    ),
                    state is DownloadInitial
                        ? ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * .55,
                                    50)),
                            onPressed: () {
                              BlocProvider.of<DownloadBloc>(context)
                                  .add(DownloadBook(book: book21));
                            },
                            icon: const Icon(Icons.download),
                            label: const Text("DOWNLOAD BOOK"),
                          )
                        : state is DownloadLoading
                            ? ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * .55,
                                        50)),
                                onPressed: () {},
                                icon: Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                                label: const Text(""),
                              )
                            : state is DownloadSuccess
                                ? ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                .55,
                                            50)),
                                    onPressed: () {
                                      BlocProvider.of<DownloadBloc>(context)
                                          .add(ViewBook(book: book21));
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PDFScreen(path: state.path),
                                      ));
                                    },
                                    icon: const Icon(Icons.menu_book_rounded),
                                    label: const Text("READ BOOK"),
                                  )
                                : Container(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:alh_pdf_view/lib.dart';
import 'package:flutter/material.dart';

class AlhPdfViewExample extends StatelessWidget {
  final String? path;
  final String book_name;
  const AlhPdfViewExample(
      {Key? key, required this.path, required this.book_name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(book_name),
      ),
      body: AlhPdfView(
        showScrollbar: true,
        fitEachPage: true,
        swipeHorizontal: true,
        filePath: path,
      ),
    );
  }
}

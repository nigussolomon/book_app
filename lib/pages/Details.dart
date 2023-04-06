import 'package:flutter/material.dart';

import 'Home.dart';

class DetailPage extends StatelessWidget {
final Book book;

DetailPage({required this.book});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Book Details'),
),
body: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Text(
book.name,
style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
),
SizedBox(height: 10),
Text(
'By ' + book.author,
style: TextStyle(fontSize: 20),
     ),
    ],
   ),
  );
 }
}

class Book {
final String name;
final String author;

Book({required this.name, required this.author});
}
import 'package:flutter/material.dart';

import 'Details.dart';

class HomePage extends StatelessWidget {
final List books = [
Book(name: 'The Alchemist', author: 'Paulo Coelho'),
Book(name: 'To Kill a Mockingbird', author: 'Harper Lee'),
Book(name: 'The Catcher in the Rye', author: 'J.D. Salinger'),
];

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Book App'),
),
body: ListView.builder(
itemCount: books.length,
itemBuilder: (BuildContext context, int index) {
return ListTile(
title: Text(books[index].name),
subtitle: Text(books[index].author),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => DetailPage(book: books[index]),
        ),
       );
      },
     );
    },
   ),
  );
 }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks().then((books) {
      setState(() {
        books = books;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('books List'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
            trailing: Text(books[index].year.toString()),
          );
        },
        itemCount: books.length,
      ),
    );
  }

  // @override
  // void setState(Null Function() param0) {}
}

class StateList {}

Future fetchBooks() async {
  final response = await http.get(
      Uri.parse('https://https://book-api-au20.onrender.com/.com/api/books'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List books = [];
    for (var book in data) {
      Books.add(book.fromJson(book));
    }
    return books;
  } else {
    throw Exception('Failed to load books');
  }
}

class Books {
  static void add(fromJson) {}
}

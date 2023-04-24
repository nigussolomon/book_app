import 'package:book_app/data/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {


  static Future<List<Book>> searchBooks(String param) async {
    var queryParameters = {
      'bookname': param,
      'authorname': param,
    };
    var uri =
        Uri.https('book-api-au20.onrender.com', '/search', queryParameters);
    var response = await http.get(uri);
    //print(response.request);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print('data: $data');
      final List<Book> books = [];
      for (var book in data) {
        books.add(Book.fromJson(book));
      }
      return books;
    } else {
      //print(response.body);
      throw Exception("failed to search books");
    }
  }

  fetchBooks() {}
}

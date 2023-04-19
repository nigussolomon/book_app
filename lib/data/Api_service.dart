import 'package:book_app/data/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  // List Books = [];
  Future fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://book-api-au20.onrender.com/books'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Book> books = [];
      for (var book in data["books"]) {
        books.add(Book.fromJson(book));
      }
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future favoriteBooks() async {
    final response = await http
        .get(Uri.parse('https://book-api-au20.onrender.com/favourites'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Book> books = [];
      for (var book in data) {
        books.add(Book.fromJson(book));
      }
      return books;
    } else {
      throw Exception('Failed to load favorite books');
    }
  }
}

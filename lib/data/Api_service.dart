import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  List Books = [];
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
}

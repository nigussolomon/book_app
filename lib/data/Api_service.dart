import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_app/data/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  //static final User? _user = FirebaseAuth.instance.currentUser;
  static final User? _user = null;

  static Future<List<Book>> fetchBooks() async {
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

  static Future<List<Book>> searchBooks(String param) async {
    //print(_user!.uid);
    var queryParameters = {
      'bookname': param,
      'authorname': param,
    };
    var uri =
        Uri.https('book-api-lksx.onrender.com', '/search', queryParameters);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // print('data: $data');
      final List<Book> books = [];
      for (var book in data) {
        books.add(Book.fromJson(book));
      }
      print("books: $books");
      return books;
    } else {
      // print(response.body);
      throw Exception("failed to search books");
    }
  }

  static Future downloadBook(int bookid) async {
    final response = await http.post(Uri.parse(
        'https://book-api-au20.onrender.com/downloads?bookid=$bookid&userid=${_user!.uid}'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load books');
    }
  }

  static Future getDownloadedBook(int downloadid, String filename) async {
    final response = await http.get(
        Uri.parse('https://book-api-au20.onrender.com/download/$downloadid'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final appDir = await getExternalStorageDirectory();
      final file = File(
          '${appDir?.path}/$filename'); // create a new file in the cache directory
      await file.writeAsBytes(response.bodyBytes);
    } else {
      throw Exception('Failed to load books');
    }
  }

  static Future getDownloadedBooks() async {
    final response = await http.get(Uri.parse(
        'https://book-api-au20.onrender.com/downloads/${_user!.uid}'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      //print(response.body);
      throw Exception("failed to search books");
    }
  }

  static Future favoriteBooks() async {
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

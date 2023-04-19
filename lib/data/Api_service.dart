import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  List Books = [];
  static User? _user = FirebaseAuth.instance.currentUser;
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
      return file.path;
    } else {
      throw Exception('Failed to load books');
    }
  }
}

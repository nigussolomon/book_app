import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_app/data/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:book_app/utils/errors/errors.dart';

class Service {
  static final User? _user = FirebaseAuth.instance.currentUser;
  // static final User? _user = null;

  static Future<List<Book>> fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://book-api-lksx.onrender.com/books'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["boooks"] == "No boooks found") {
        throw NoBooksException("No Books Found");
      } else {
        final List<Book> books = [];
        for (var book in data["books"]) {
          books.add(Book.fromJson(book));
        }
        return books;
      }
    } else {
      print("internet error");
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
      if (data == []) {
        throw NoBooksException("books not found");
      } else {
        final List<Book> books = [];
        for (var book in data) {
          books.add(Book.fromJson(book));
        }
        return books;
      }
    } else {
      throw Exception("failed to search books");
    }
  }

  static Future downloadBook(int bookid) async {
    final response = await http.post(Uri.parse(
        'https://book-api-lksx.onrender.com/downloads?bookid=$bookid&userid=${_user!.uid}'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load books');
    }
  }

  static Future getDownloadedBook(int downloadid, String filename) async {
    final response = await http.get(
        Uri.parse('https://book-api-lksx.onrender.com/download/$downloadid'));
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
        'https://book-api-lksx.onrender.com/downloads/${_user!.uid}'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      //print(response.body);
      throw Exception("failed to search books");
    }
  }

  static Future uploadbook(String? path, String title, String author,
      String description, String? path2) async {
    final url = Uri.parse('https://book-api-lksx.onrender.com/books');
    final file = File(path!);
    final img = File(path2!);
    final request = http.MultipartRequest('POST', url);
    final fileStream = http.ByteStream(file.openRead());
    final imageStream = http.ByteStream(img.openRead());
    final imageLength = await img.length();
    final fileLength = await file.length();
    final multipartFile = http.MultipartFile('bookfile', fileStream, fileLength,
        filename: file.path.split('/').last);
    final multipartImage = http.MultipartFile(
        'image_url', imageStream, imageLength,
        filename: file.path.split('/').last);
    request.files.add(multipartFile);
    request.files.add(multipartImage);
    request.fields['bookname'] = title;
    request.fields['author_name'] = author;
    request.fields['authorid'] = _user!.uid;
    request.fields['description'] = description;

    final response = await request.send();
    final responseString = await response.stream.bytesToString();
    print(responseString);
    return responseString;
  }

  static Future likeBook(int book_id) async {
    final url = Uri.parse('https://book-api-lksx.onrender.com/favourites/');
    final request = http.MultipartRequest('POST', url);
    request.fields['user_id'] = _user!.uid;
    request.fields['book_id'] = book_id.toString();
    final response = await request.send();
    final responseString = await response.stream.bytesToString();
    print(responseString);
    return responseString;
  }

  static Future favoriteBooks() async {
    final response = await http.get(Uri.parse(
        'https://book-api-lksx.onrender.com/favourites/${_user?.uid}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List books = [];
      for (var book in data) {
        books.add(book);
      }
      return books;
    } else {
      throw Exception('Failed to load favorite books');
    }
  }
}

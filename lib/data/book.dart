import 'package:book_app/data/user.dart';

class Book {
  int authorId;
  int id;
  String bookFile;
  String bookName;
  String authorName;

  Book(
      {required this.authorId,
      required this.id,
      required this.bookFile,
      required this.bookName,
      required this.authorName});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      authorId: json['author_id'],
      id: json['id'],
      bookFile: json['bookfile'],
      bookName: json['bookname'],
      authorName: json['bookname'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'author_id': authorId,
      'id': id,
      'bookfile': bookFile,
      'bookname': bookName,
      'author_name': authorName,
    };
    return data;
  }
}

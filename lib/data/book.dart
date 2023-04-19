import 'package:book_app/data/user.dart';

class Book {
  int bookId;
  String downloadUrl;
  String bookName;
  User bookAuthor;

  Book(
      {required this.bookId,
      required this.downloadUrl,
      required this.bookName,
      required this.bookAuthor});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json[0],
      downloadUrl: json['downloadUrl'],
      bookName: json['bookName'],
      bookAuthor: json[''],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bookId'] = bookId;
    data['downloadUrl'] = downloadUrl;
    data['bookName'] = bookName;
    data['bookAuthor'] = bookAuthor;
    return data;
  }
}

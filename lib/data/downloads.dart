import 'package:book_app/data/book.dart';
import 'package:book_app/data/user.dart';

class Download {
  Book book;
  User user;

  Download({
    required this.book,
    required this.user,
  });

  factory Download.fromJson(Map<String, dynamic> json) {
    return Download(
      book: json['book'],
      user: json['user'],
    );
  }
}

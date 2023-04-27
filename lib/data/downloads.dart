import 'package:book_app/data/book.dart';
import 'package:book_app/data/user.dart';

class Download {
  int book_id;
  String user_id;

  Download({
    required this.book_id,
    required this.user_id,
  });

  factory Download.fromJson(Map<String, dynamic> json) {
    return Download(
      book_id: json['bookid'],
      user_id: json['userid'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'bookid': book_id,
      'userid': user_id,
    };
    return data;
  }
}

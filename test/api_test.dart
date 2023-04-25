import 'package:flutter_test/flutter_test.dart';
import 'package:book_app/data/Api_service.dart';
import 'package:book_app/data/book.dart';

import 'dart:developer' as dev;

void main() async {
  test('api must search for books given a param', () async {
    List<Book> result = await Service.searchBooks("chip8");

    dev.log("hello world");
    //print("result: $result");

    assert(result.isNotEmpty);
  });
}

// void testSearchApi() {
  // group('search api', () {
    //test();
  // });
// }

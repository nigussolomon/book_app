class NoBooksException implements Exception {
  String message;
  NoBooksException(this.message);
}

class FailedToLoadBooksError implements Exception {
  String message;
  FailedToLoadBooksError(this.message);
}

class BookNotFound implements Exception {
  String message;
  BookNotFound(this.message);
}

class SearchError implements Exception {
  String message;
  SearchError(this.message);
}

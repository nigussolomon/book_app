class Book {
  String authorId;
  int id;
  String bookFile;
  String bookName;
  String authorName;
  String imageUrl;
  String description;

  Book(
      {required this.authorId,
      required this.id,
      required this.bookFile,
      required this.bookName,
      required this.authorName,
      required this.imageUrl,
      required this.description});

  factory Book.fromJson(Map<String, dynamic> json) {
    print("json: $json");
    return Book(
        authorId: json['author_id'],
        id: json['id'],
        bookFile: json['bookfile'],
        bookName: json['bookname'],
        authorName: json['author_name'],
        imageUrl: json['image_url'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'author_id': authorId,
      'id': id,
      'bookfile': bookFile,
      'bookname': bookName,
      'author_name': authorName,
      'image_url': imageUrl,
      'description': description
    };
    return data;
  }
}

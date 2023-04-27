class Book {
  String authorId;
  int id;
  String image_url;
  String bookFile;
  String bookName;
  String authorName;
  String desc;

  Book({
    required this.authorId,
    required this.desc,
    required this.id,
    required this.image_url,
    required this.bookFile,
    required this.bookName,
    required this.authorName,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    print("json: $json");
    return Book(
        authorId: json['author_id'],
        id: json['id'],
        bookFile: json['bookfile'],
        bookName: json['bookname'],
        authorName: json['author_name'],
        image_url: json['image_url'],
        desc: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'author_id': authorId,
      'id': id,
      'bookfile': bookFile,
      'bookname': bookName,
      'author_name': authorName,
      'image_url': image_url
    };
    return data;
  }
}

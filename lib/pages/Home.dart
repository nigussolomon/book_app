import "package:flutter/material.dart";
import "Details.dart";

class HomePage extends StatelessWidget {
  final Book book1;
  final search = TextEditingController();
  HomePage({Key? key, required this.book1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Books",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                Icon(
                  Icons.people,
                  color: Colors.black,
                )
              ],
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(7),
                  child: TextField(
                    controller: search,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(7, 7))),
                      hintText: "Search",
                      labelText: "Search",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: books.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 22 * 10,
                        crossAxisSpacing: 22,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                        book: books[index],
                        // press: () {},
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                book21: books[index],
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ))));
  }
}

class ItemCard extends StatelessWidget {
  final Book book;
  final VoidCallback press;
  // required this.movie, required this.press,
  ItemCard({
    required this.book,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(22),
              // height: 170,
              // width: 150,
              decoration: BoxDecoration(
                // color: ,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(tag: "${book.id}", child: Image.asset(book.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22 / 4),
            child: Text(
              book.title,
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
          ),
          Text("\$${book.price}",
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ],
      ),
    );
  }
}

class Book {
  final String image, title, description;
  final num price, time, id;
  final Color color;

  Book({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.color,
    required this.time,
  });
}

List<Book> books = [
  Book(
      id: 1,
      image: "assets/images/the_catcher_in_the_rye.jpg",
      title: "The Catcher in the rye",
      price: 20,
      description: "dummyText",
      color: Color.fromARGB(255, 92, 92, 92),
      time: 130),
  Book(
      id: 2,
      image: "assets/images/the_catcher_in_the_rye.jpg",
      title: "The Catcher in the rye",
      price: 20,
      description: "dummyText",
      color: Color.fromARGB(255, 138, 117, 117),
      time: 130),
  Book(
      id: 3,
      image: "assets/images/the_catcher_in_the_rye.jpg",
      title: "The Catcher in the rye",
      price: 20,
      description: "dummyText",
      color: Color.fromARGB(255, 212, 131, 38),
      time: 130),
  Book(
      id: 4,
      image: "assets/images/the_catcher_in_the_rye.jpg",
      title: "The Catcher in the rye",
      price: 20,
      description: "dummyText",
      color: Color.fromARGB(255, 50, 67, 68),
      time: 130),
  Book(
      id: 5,
      image: "assets/images/the_catcher_in_the_rye.jpg",
      title: "The Catcher in the rye",
      price: 20,
      description: "dummyText",
      color: Color.fromARGB(255, 51, 49, 49),
      time: 130),
  Book(
      id: 6,
      image: "assets/images/the_catcher_in_the_rye.jpg",
      title: "The Catcher in the rye",
      price: 20,
      description: "dummyText",
      color: Color.fromARGB(255, 231, 103, 43),
      time: 130)
];

import "package:book_app/data/book.dart";
import "package:book_app/data/user.dart";
import "package:flutter/material.dart";
import "../components/bottomNavbar.dart";
import "../components/top_bar.dart";
import "Details.dart";

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List books = [
      Book(
          bookId: 1,
          downloadUrl: "",
          bookName: "bookName",
          bookAuthor: User(
              uid: 1,
              firstname: "firstname",
              lastname: "lastname",
              email: "email",
              phonenumber: "phonenumber")),
      Book(
          bookId: 1,
          downloadUrl: "",
          bookName: "bookName",
          bookAuthor: User(
              uid: 1,
              firstname: "firstname",
              lastname: "lastname",
              email: "email",
              phonenumber: "phonenumber")),
      Book(
          bookId: 1,
          downloadUrl: "",
          bookName: "bookName",
          bookAuthor: User(
              uid: 1,
              firstname: "firstname",
              lastname: "lastname",
              email: "email",
              phonenumber: "phonenumber"))
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  //prefixIcon: const Icon(Icons.search_outlined),
                  hintText: 'Search Books here..',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search_outlined, color: Colors.blue),
                    onPressed: () => _searchController.clear(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: books.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 22,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      Book book = books[index];
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      book21: books[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 180,
                                height: 200,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://dfb503wu29eo2.cloudfront.net/slir/h1200/png24-front/bookcover0010361.jpg'),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.bookName,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      book.bookAuthor.firstname,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.thumb_up))
                              ],
                            ))
                          ],
                        ),
                      );
                    }),
              ),
            ],
          )),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

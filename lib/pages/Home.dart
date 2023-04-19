import "package:book_app/data/book.dart";
import "package:book_app/data/user.dart";
import "package:book_app/resources/routes.dart";
import "package:flutter/material.dart";
import "../components/bottomNavbar.dart";
import "../components/item_card.dart";
import "../components/top_bar.dart";
import "Details.dart";

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List books = [
      Book(
          bookId: 4,
          downloadUrl: "",
          bookName: "bookName",
          bookAuthor: User(
              uid: 1,
              firstname: "firstname",
              lastname: "lastname",
              email: "email",
              phonenumber: "phonenumber")),
      Book(
          bookId: 2,
          downloadUrl: "",
          bookName: "bookName21",
          bookAuthor: User(
              uid: 1,
              firstname: "firstname",
              lastname: "lastname",
              email: "email",
              phonenumber: "phonenumber")),
      Book(
          bookId: 3,
          downloadUrl: "",
          bookName: "bookName",
          bookAuthor: User(
              uid: 1,
              firstname: "firstname",
              lastname: "lastname",
              email: "email",
              phonenumber: "phonenumber")),
      Book(
          bookId: 5,
          downloadUrl: "",
          bookName: "mybook",
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
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.searchResult);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Top Picks",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Hero(
                                  tag: "book tag",
                                  child: Image.network(
                                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.n-GYj4PuriTRbbExR10xsgHaHa%26pid%3DApi&f=1&ipt=e872127db6fd44a6b9f9212500ce4e5bee1367785b01b0c5eec9340f81056a38&ipo=images",
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 70,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "Title",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text("Author",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    const Text(
                                      "description description",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Recently Added",
                style: TextStyle(fontWeight: FontWeight.w700),
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
                      childAspectRatio: 0.6,
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
                                height: 160,
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
      bottomNavigationBar: const BottomBar(
        index: 0,
      ),
    );
  }
}

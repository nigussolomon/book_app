import "package:book_app/data/book.dart";
import "package:book_app/data/user.dart";
import "package:book_app/resources/routes.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../bloc/book_bloc.dart";
import "../bloc/search_bloc.dart";
import "../bloc/search_event.dart";
import "../components/bottomNavbar.dart";
import "../components/item_card.dart";
import "../components/top_bar.dart";
import "Details.dart";

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookInitial) {
            BlocProvider.of<BookBloc>(context).add(const BookFetchEvent());
          } else if (state is BookLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BookSuccess) {
            if (state.book.isEmpty) {
              return const Center(
                child: Text(
                  "No Books",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              );
            } else {
              print("object");
              return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          //prefixIcon: const Icon(Icons.search_outlined),
                          hintText: 'Search Books here..',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search_outlined,
                                color: Colors.blue),
                            onPressed: () {
                              BlocProvider.of<SearchBloc>(context).add(
                                  SubmitSearchEvent(_searchController.text));
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
                          itemCount:
                              state.book.length - (state.book.length ~/ 2),
                          itemBuilder: (BuildContext context, int index) {
                            Book book = state.book[index];
                            return Container(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Hero(
                                          tag: "book tag + $index",
                                          child: Image.network(
                                            "https://dfb503wu29eo2.cloudfront.net/slir/h1200/png24-front/bookcover0010361.jpg",
                                            fit: BoxFit.cover,
                                            width: 70,
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              book.bookName,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(book.authorName,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey))
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
                            itemCount: state.book.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 22,
                              childAspectRatio: 0.6,
                            ),
                            itemBuilder: (context, index) {
                              Book book = state.book[index];
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
                                              book21: state.book[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 180,
                                        height: 160,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
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
                                        child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.bookName,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            book.authorName,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                    )),
                                    Text(
                                      book.authorName,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ));
            }
          } else if (state is BookFailed) {
            return const Center();
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomBar(
        index: 0,
      ),
    );
  }
}

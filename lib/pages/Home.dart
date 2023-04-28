import "package:book_app/data/book.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_locales/flutter_locales.dart";
import "../bloc/book_bloc.dart";
import "../components/bottomNavbar.dart";
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
          } else if (state is BookEmpty) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  searchText(_searchController, context),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "No Books",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is BookSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchText(_searchController, context),
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
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.book.length - (state.book.length ~/ 2),
                      itemBuilder: (BuildContext context, int index) {
                        Book book = state.book[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Hero(
                                tag: "book tag + $index",
                                child: Image.network(
                                  "https://book-api-b.onrender.com/images/${book.id}",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
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
                  bookGrid(state),
                ],
              ),
            );
          } else if (state is BookFailed) {
            return Center(child: LocaleText(state.msg));
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

Widget bookGrid(BookSuccess state) {
  return Expanded(
    child: GridView.builder(
      itemCount: state.book.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 0.4,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        Book book = state.book[index];
        return Column(
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://book-api-b.onrender.com/images/${book.id}',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  book.authorName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  book.desc,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
}

Widget searchText(
    TextEditingController searchController, BuildContext context) {
  return TextField(
    controller: searchController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      hintText: Locales.string(context, 'searchbookshere'),
      suffixIcon: const Icon(Icons.search_outlined, color: Colors.blue),
    ),
    onTap: () {
      Navigator.pushNamed(context, "/searcResult");
    },
  );
}

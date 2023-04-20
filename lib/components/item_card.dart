import 'package:flutter/material.dart';
import 'package:book_app/data/book.dart';

class ItemCard extends StatelessWidget {
  final List<Book?> items;

  const ItemCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: size.width,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: items[index]!.bookName,
                      child: Image.network(
                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.n-GYj4PuriTRbbExR10xsgHaHa%26pid%3DApi&f=1&ipt=e872127db6fd44a6b9f9212500ce4e5bee1367785b01b0c5eec9340f81056a38&ipo=images",
                        fit: BoxFit.cover,
                        width: 80,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              items[index]!.bookName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(items[index]!.authorName,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Text(
                          items[index]!.authorName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

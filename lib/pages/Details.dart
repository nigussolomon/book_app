import 'package:flutter/material.dart';
import '../components/top_bar.dart';
import '../data/book.dart';
import 'Home.dart';

class DetailsScreen extends StatelessWidget {
  final Book book21;
  const DetailsScreen({Key? key, required this.book21}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://dfb503wu29eo2.cloudfront.net/slir/h1200/png24-front/bookcover0010361.jpg'),
                  )),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://dfb503wu29eo2.cloudfront.net/slir/h1200/png24-front/bookcover0010361.jpg'),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              book21.bookName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Lorem ipsum dolor sit amet consectetur. Imperdiet in turpis netus enim aliquam nullam nunc. Quam blandit mattis mauris feugiat senectus sit sit pulvinar leo. Nibh risus risus faucibus suspendisse orci ut hendrerit cursus. Volutpat lacus morbi morbi metus volutpat sed urna aliquam.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      backgroundColor: Colors.red),
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("LIKE"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .65, 50)),
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text("DOWNLOAD BOOK"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

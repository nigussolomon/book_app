// import 'package:flutter/material.dart';
// import 'package:book_app/resources/model.dart';
// import 'Home.dart';

// class DetailPage extends StatelessWidget {
//   final Book book;

//   const DetailPage({super.key, required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book Details'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             book.name,
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'By ' + book.author,
//             style: TextStyle(fontSize: 20),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Book {
//   final String name;
//   final String author;

//   Book({required this.name, required this.author});
// }

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:cinema/models/movies.dart';
// import '../../utils/constant.dart';
// import '../home/body.dart';
// import 'package:cinema/screens/detail/body.dart';
import 'package:book_app/resources/model.dart';

import 'Home.dart';

class DetailsScreen extends StatelessWidget {
  final Book book21;
  const DetailsScreen({Key? key, required this.book21}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: book21.color,
      appBar: buildAppBar(context),
      // body: Body(movie: book21),
      // body: DetailsScreen(book21: book21),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: book21.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.logout),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
        ),

        // IconButton(
        //   onPressed: (){},
        //   icon: SvgPicture.asset(
        //     "assets/icons/cart.svg",
        //   ),
        // ),
        SizedBox(
          width: 22 / 2,
        ),
      ],
    );
  }
}

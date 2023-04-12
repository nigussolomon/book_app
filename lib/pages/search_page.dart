import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  //const List<Map<String, Object>> books = [];
  
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext  context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
    appBar: AppBar(
      title: Text("Book App", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      actions: [
        Icon(Icons.account_circle, color: Colors.blue),
      ],
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    body: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: size.width,
          // color: Colors.grey,

          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    //prefixIcon: const Icon(Icons.search_outlined),
                    hintText: 'Search Books here..',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search_outlined, color: Colors.blue),
                      onPressed: () => _searchController.clear(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),


        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: size.width,
            // color: Colors.red,
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),

              itemCount: 10,

              separatorBuilder: (context, index){
                return const Divider(height: 30);
              },

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => print("tapped $index"),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Hero(
                            tag: "book tag",
                            child: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.n-GYj4PuriTRbbExR10xsgHaHa%26pid%3DApi&f=1&ipt=e872127db6fd44a6b9f9212500ce4e5bee1367785b01b0c5eec9340f81056a38&ipo=images",
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
                              Text(
                                "Title",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),


                              SizedBox(height: 2),

                              Text("Author", style: TextStyle(fontSize: 12, color: Colors.grey)),

                              SizedBox(height: 10),

                              Text(
                                "description description",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              //SizedBox(height: 20),

                              //Text("type of book"),
                            ],
                          ),
                        ),

                      ]
                    ),
                  ),
                );
              }
            ),
          ),
        ),
      ],
    )
    );
  }
}

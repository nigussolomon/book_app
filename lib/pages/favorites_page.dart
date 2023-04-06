class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("favorites"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 140,
                    color: Colors.red,
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Title",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),

                        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

                        Text(
                          "author",
                          style: const TextStyle(fontSize: 14.0),
                        ),

                        const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),

                        Text(
                          '20 views',
                          style: const TextStyle(fontSize: 12.0),
                        ),

                      ],
                    ),
                  ),
                ),

                const Icon(
                  color: Colors.red,
                  Icons.favorite,
                  size: 24.0,
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



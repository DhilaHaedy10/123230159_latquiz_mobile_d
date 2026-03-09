import 'package:flutter/material.dart';
import 'models/data.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  List<Game> filteredGames = gameList;

  void searchGame(String query) {
    final results = gameList.where((game) {
      return game.judul.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredGames = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome,",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),

                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/Jessi JKT48.jpeg"),
                ),
              ],
            ),

            const SizedBox(height: 15),

            TextField(
              controller: searchController,

              onChanged: (value) {
                searchGame(value);
              },

              decoration: InputDecoration(
                hintText: "Search Game",
                // prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
              ),
            ),

            SizedBox(height: 10),

            Divider(
              color: Colors.grey,
              thickness: 1,
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredGames.length,
                itemBuilder: (context, index) {
                  final game = filteredGames[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => DetailPage(game: game),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(bottom: 15),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            game.gambar,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.judul,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  game.tanggal,
                                  style: const TextStyle(color: Colors.blueGrey),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  game.deskripsi,
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

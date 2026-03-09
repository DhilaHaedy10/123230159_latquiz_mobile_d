import 'package:flutter/material.dart';
import 'models/data.dart';

class DetailPage extends StatelessWidget {
  final Game game;

  const DetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.judul),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              game.gambar, width: double.infinity, height: 250, fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Card(     
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                game.judul, textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                game.tanggal, textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),

                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                                height: 25,
                              ),

                              Text(
                                game.deskripsi, textAlign: TextAlign.justify,
                              )
                            ],
                          )

                        )
                      ],
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

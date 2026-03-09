import 'package:flutter/material.dart';
import 'models/data.dart';

class DetailPage extends StatefulWidget {
  final Game game;

  const DetailPage({super.key, required this.game});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLiked = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.judul),
        actions: [
          IconButton(
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.grey),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.game.gambar,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
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
                                widget.game.judul,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                widget.game.tanggal,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blueGrey),
                              ),

                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                                height: 25,
                              ),

                              Text(
                                widget.game.deskripsi,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

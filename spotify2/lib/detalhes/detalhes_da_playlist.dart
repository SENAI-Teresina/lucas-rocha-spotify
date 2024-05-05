import 'package:flutter/material.dart';

class DetalhesDaPlaylistScreen extends StatelessWidget {
  final String nomePlaylist;

  const DetalhesDaPlaylistScreen({super.key, required this.nomePlaylist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da Playlist"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.library_music,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              nomePlaylist,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

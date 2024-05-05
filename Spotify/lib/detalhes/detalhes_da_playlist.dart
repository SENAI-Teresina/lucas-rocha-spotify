import 'package:Spotify/data/musica.dart';
import 'package:Spotify/data/playlist.dart';
import 'package:flutter/material.dart';

class DetalhesDaPlaylistScreen extends StatelessWidget {
  final Playlist playlist;

  const DetalhesDaPlaylistScreen({super.key, required this.playlist});

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                playlist.titulo,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Músicas"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: ListView.builder(
                itemCount: playlist.musicas.length,
                itemBuilder:  (BuildContext context, int index){
                  Musica mymusica = playlist.musicas[index];
                  return ListTile(
                    leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(mymusica.capaUrl),
                        ),
                    title: Text(mymusica.titulo),
                    subtitle: Text(mymusica.artista.nome),
                  );
                } 
              ),
            )
          ],
        ),
      ),
    );
  }
}

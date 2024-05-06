import 'package:Spotify/data/musica.dart';
import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/main.dart';
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
             Icon(
              Icons.library_music,
              size: 100,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                playlist.titulo,
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Músicas",
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black,),),
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
                    title: Text(mymusica.titulo,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),),
                    subtitle: Text(mymusica.artista.nome,  
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),),
                  );
                } 
              ),
            )
          ],
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}

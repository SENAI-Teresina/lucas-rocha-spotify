import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/main.dart';
import 'package:flutter/material.dart';
import 'detalhes_aba.dart';

class PlaylistTab extends StatelessWidget {
  const PlaylistTab({super.key, required List<Playlist> playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        title: Text(
          "Playlist",
          style: TextStyle(fontSize: 24, color: isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetalhesAba()),
              );
            },
            child: ListTile(
              leading: const Icon(Icons.music_note),
              title: Text("Favoritos ${index + 1}"),
              onTap: () {
                  
              } ,
            ),  
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        foregroundColor: isDarkMode ? Colors.white : Colors.grey,

        onPressed: () {
            isDarkMode = !isDarkMode;
        },
        child: Icon(Icons.brightness_medium, color: !isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }
}
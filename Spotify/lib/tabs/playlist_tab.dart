import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/detalhes/detalhes_da_playlist.dart';
import 'package:Spotify/main.dart';
import 'package:flutter/material.dart';
import '../tabs/detalhes_aba.dart';

class PlaylistTab extends StatelessWidget {
  const PlaylistTab({super.key, required List<Playlist> playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        // title: Text(
        //   "Playlist",
        //   style: TextStyle(fontSize: 24, color: isDarkMode ? Colors.white : Colors.black),
        // ),
      ),
      body: Column(
        children: [
          SizedBox(

            child: ListView.builder(
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                Playlist myplaylist = playlists[index];
                return ListTile(
                  leading: Icon(Icons.music_note, color: isDarkMode ? Colors.white : Colors.black),
                  title: Text(myplaylist.titulo),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDaPlaylistScreen(playlist: myplaylist)));
                  } ,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        foregroundColor: isDarkMode ? Colors.white : Colors.grey,

        onPressed: () {
            isDarkMode = !isDarkMode;
        },
        child: Icon(Icons.brightness_medium, color: !isDarkMode ? Colors.black : Colors.white),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}
import 'dart:js';

import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/detalhes/detalhes_da_playlist.dart';
import 'package:Spotify/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../tabs/detalhes_aba.dart';

class PlaylistTab extends StatelessWidget {
  const PlaylistTab({super.key, required List<Playlist> playlist});

  @override
  Widget build(BuildContext context) {

    final double maxHeight = MediaQuery.of(context).size.height;
    double margin = MediaQuery.of(context).size.height*0.002;
    double title = MediaQuery.of(context).size.height*0.035;
    double listSize = (MediaQuery.of(context).size.height/2)-4*margin-title;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: margin),
            child: Text('Playlist', style: TextStyle(color: isDarkMode? Colors.white: Colors.black, fontSize: title),),
          ),
          Container(
            margin: EdgeInsets.only(bottom: margin),
            height: listSize,
            color: Colors.redAccent,
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
import 'package:Spotify/body.dart';
import 'package:Spotify/data/playlist.dart';
import 'package:flutter/material.dart';
import 'detalhes_aba.dart';

class PlaylistTab extends StatelessWidget {
  const PlaylistTab({Key? key, required List<Playlist> playlist}) : super(key: key);

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
              // onTap: () {
              //   // Ação ao clicar em uma música
              // },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Alternar entre o modo claro e escuro
          isDarkMode = !isDarkMode;
          // Atualizar o estado do aplicativo
          (context as Element).markNeedsBuild();
        },
        child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Coloca o FAB no canto inferior direito
    );
  }
}

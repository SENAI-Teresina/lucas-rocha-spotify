import 'package:flutter/material.dart';
import 'detalhes_aba.dart';

class PlaylistTab extends StatelessWidget {
  const PlaylistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Playlist"),
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
              title: Text("Música ${index + 1}"),
              // onTap: () {
              //   // Ação ao clicar em uma música
              // },
            ),
          );
        },
      ),
    );
  }
}

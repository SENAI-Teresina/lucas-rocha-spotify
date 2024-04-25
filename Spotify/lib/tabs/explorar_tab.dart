import 'package:flutter/material.dart';
import '../data/musica.dart';

class ExplorarTab extends StatelessWidget {
  const ExplorarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explorar"),
      ),
      body: ListView.builder(
        itemCount: musicas.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(musicas[index].capaUrl),
            ),
            title: Text(musicas[index].titulo),
            subtitle: Text(musicas[index].artista.nome),
            onTap: () {
              // Implemente ação ao tocar em uma música
            },
          );
        },
      ),
    );
  }
}

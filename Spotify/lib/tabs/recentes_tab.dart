import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../tabs/detalhes_aba.dart';

class RecentesTab extends StatelessWidget {
  const RecentesTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Encontre o último artista visualizado
    Artista? ultimoArtista = artistas.firstWhere(
      (artista) => artista.ultimoVisto,
      orElse: () => Artista(nome: "Nenhum artista", imagemUrl: "", descricao: "", curiosidade: "",),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recentes"),
      ),
      body: (ultimoArtista != null && ultimoArtista.nome != "Nenhum artista")
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetalhesAba()),
                );
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ultimoArtista.imagemUrl),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ultimoArtista.nome,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: Text(
                "Nenhum artista visualizado recentemente",
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}

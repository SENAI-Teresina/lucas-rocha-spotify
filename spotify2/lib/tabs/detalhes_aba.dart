import 'package:flutter/material.dart';
import '../data/artistas.dart';

class DetalhesAba extends StatelessWidget {
  const DetalhesAba({super.key});

  @override
  Widget build(BuildContext context) {
    Artista? ultimoArtista = artistas.firstWhere(
      (artista) => artista.ultimoVisto,
      orElse: () => Artista(nome: "Nenhum artista", imagemUrl: "", descricao: "", curiosidade: "",),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Center(
        child: ultimoArtista != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(ultimoArtista.imagemUrl),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Nome: ${ultimoArtista.nome}",
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Descrição: ${ultimoArtista.descricao}",
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : const Text(
                "Nenhum artista visualizado recentemente",
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

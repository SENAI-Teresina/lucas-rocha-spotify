/*import 'package:flutter/material.dart';
import '../data/album.dart';

class DetalhesDoAlbumScreen extends StatelessWidget {
  final Album album;

  const DetalhesDoAlbumScreen({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Álbum"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              album.titulo,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Artista: ${album.artista}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Ano de Lançamento: ${album.anoLancamento}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Image.asset(
              album.capaUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}*/
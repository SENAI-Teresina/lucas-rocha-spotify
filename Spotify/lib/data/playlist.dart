import 'package:Spotify/data/musica.dart';
import '../data/musica.dart';

class Playlist {
  final String titulo;
  final String artista;
  final String capaUrl;
  final List<Musica> musicas;

  Playlist({required this.titulo, required this.artista, required this.capaUrl, required this.musicas});
}

List<Playlist> playlist = [
  Playlist(titulo: 'nome', artista: 'Felipe Amorim', capaUrl: 'assets/capa/eu.jpg', musicas: [
    musicas[0]
  ])
];
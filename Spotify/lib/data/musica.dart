// ignore_for_file: unused_import

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../detalhes/detalhes_da_musica.dart';

class Musica {
  final String titulo;
  final Artista artista;
  final String capaUrl;
  final String mp3Url; // Alterado para String

  Musica({
    required this.titulo,
    required this.artista,
    required this.capaUrl,
    required this.mp3Url,
  });
}

List<Musica> musicas = [
  Musica(
    titulo: "Eu tenho que me decidir",
    artista: artistas[0],
    capaUrl: "assets/capa/eu.jpg",
    mp3Url: "assets/musicas/eu.MP3", // Convertido para String
  ),
  Musica(
    titulo: "Só pra você lembrar",
    artista: artistas[1],
    capaUrl: "assets/capa/sopra.jpg",
    mp3Url: "assets/musicas/sopra.MP3", // Convertido para String
  ),
  Musica(
    titulo: "Meu Sonho",
    artista: artistas[2],
    capaUrl: "assets/capa/meusonho.jpg",
    mp3Url: "assets/musicas/meu_sonho.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Pássaro Noturno",
    artista: artistas[3],
    capaUrl: "assets/capa/passaro.jpg",
    mp3Url: "assets/musicas/passaro.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Lápis",
    artista: artistas[4],
    capaUrl: "assets/capa/lapis.jpg",
    mp3Url: "assets/musicas/lapis.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Investe em mim",
    artista: artistas[5],
    capaUrl: "assets/capa/investe.jpg",
    mp3Url: "assets/musicas/investe.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Adeus",
    artista: artistas[6],
    capaUrl: "assets/capa/Adeus.jpg",
    mp3Url: "assets/musicas/adeus.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Tomara",
    artista: artistas[7],
    capaUrl: "assets/capa/tomara.jpg",
    mp3Url: "assets/musicas/tomara.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Tem Café",
    artista: artistas[8],
    capaUrl: "assets/capa/tem.jpg",
    mp3Url: "assets/musicas/tem.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Decida",
    artista: artistas[9],
    capaUrl: "assets/capa/decida.jpg",
    mp3Url: "assets/musicas/decida.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Sete Bilhões",
    artista: artistas[10],
    capaUrl: "assets/capa/sete.jpg",
    mp3Url: "assets/musicas/sete.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Pião de vida loka",
    artista: artistas[11],
    capaUrl: "assets/capa/piao.jpg",
    mp3Url: "assets/musicas/piao.mp3", // Convertido para String
  ),
  Musica(
    titulo: "Tapa no Vento",
    artista: artistas[12],
    capaUrl: "assets/capa/tapa.jpg",
    mp3Url: "assets/musicas/tapa.mp3", // Convertido para String
  ),
  Musica(
    titulo: "A Lua",
    artista: artistas[13],
    capaUrl: "assets/capa/lua.jpg",
    mp3Url: "assets/musicas/lua.mp3", // Convertido para String
  ),
  Musica(
    titulo: 'Pontes Indestrutíveis', 
    artista: artistas[14], 
    capaUrl: "assets/capa/pontes.jpg",
    mp3Url: "assets/musicas/pontes.MP3",
  ),
];

// ignore_for_file: unused_import

import 'package:spotify2/data/artistas.dart';
import 'package:flutter/material.dart';

class Favorito {
  final Artista artista;

  Favorito({required this.artista});
}

List<Favorito> favoritos = [
  Favorito(
    artista: artistas[2]
  ),
  Favorito(
    artista: artistas[4]
  ),
  Favorito(
    artista: artistas[6]
  ),
  Favorito(
    artista: artistas[0]
  ),
  Favorito(
    artista: artistas[1]
  ),
];

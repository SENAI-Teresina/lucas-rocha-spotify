// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:Spotify/data/playlist.dart';
import 'package:flutter/material.dart';
import '../data/artistas.dart'; // Importe os dados dos artistas
import '../data/musica.dart'; // Importe os dados das músicas
import '../data/favoritos.dart'; // Importe os dados dos favoritos
import '../body.dart';
import '../tabs/biblioteca_aba.dart';
import '../tabs/favoritos_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3, // Número de abas
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Spotify",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            actions: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: isOpened ? 200 : 0,
                height: 30,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar',
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(text: "Explorar"),
                Tab(text: "Favoritos"),
                Tab(text: "Biblioteca"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Body(artistas: artistas, musicas: musicas, favoritos: favoritos, playlist: playlist, listHeight: 400),
              FavoritosTab(favoritos: favoritos),
              BibliotecaTab(artistas: artistas, musicas: musicas, favoritos: favoritos, playlist: playlist)
            ],
          ),
        ),
      ),
    );
  }
}

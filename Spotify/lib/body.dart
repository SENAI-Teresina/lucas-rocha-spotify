import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/detalhes/detalhes_da_musica.dart';
import 'package:Spotify/detalhes/detalhes_do_artista.dart';
import 'package:Spotify/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../data/musica.dart'; 
import '../data/favoritos.dart'; 

class Body extends StatefulWidget {
  final List<Artista> artistas;
  final List<Musica> musicas;
  final List<Favorito> favoritos;
  final List<Playlist> playlist;
  final double listHeight;

  const Body({
    Key? key,
    required this.artistas,
    required this.musicas,
    required this.favoritos,
    required this.playlist,
    required this.listHeight,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(16.0),
            child: Text(
              "Bem-vindo de volta!",
              style: TextStyle(
                  fontSize: 24,
                  color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          buildBody(isDarkMode, widget, 300),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        foregroundColor: isDarkMode ? Colors.white : Colors.grey,
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: Icon(Icons.brightness_medium,
            color: !isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }
}

Widget buildBody(isDarkMode, widget, listHeight) {
  const List<String> menuItems = ['Detalhes do Artista', 'Detalhes da Música'];

  return Container(
    color: isDarkMode ? Colors.black : Colors.white,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.music_note_outlined,
                    color: isDarkMode ? Colors.white : Colors.black),
                Text(
                  "Artistas",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.artistas.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (kDebugMode) {
                            print(widget.artistas[index].nome +
                                'pressed');
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetalhesDoArtistaScreen(
                                  artista: widget.artistas[index])));
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage(widget.artistas[index].imagemUrl),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.artistas[index].nome,
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.my_library_music_outlined,
                    color: isDarkMode ? Colors.white : Colors.black),
                Text(
                  "Músicas",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Theme(
            data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
            child: SizedBox(
              height: listHeight,
              child: ListView.builder(
                itemCount: widget.musicas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(widget.musicas[index].capaUrl),
                    ),
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetalhesDaMusicaScreen(
                                    musica: widget.musicas[index])));
                      },
                      child: Text(
                        widget.musicas[index].titulo,
                        style: TextStyle(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    subtitle: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetalhesDoArtistaScreen(
                                artista: widget.musicas[index].artista)));
                      },
                      child: Text(
                        widget.musicas[index].artista.nome,
                        style: TextStyle(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (String choice) {
                        switch (choice) {
                          case 'Detalhes do Artista':
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetalhesDoArtistaScreen(
                                    artista: widget.musicas[index].artista)));
                            break;
                          case 'Detalhes da Música':
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetalhesDaMusicaScreen(musica: widget.musicas[index])));
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return menuItems.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDaMusicaScreen(musica: widget.musicas[index])));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
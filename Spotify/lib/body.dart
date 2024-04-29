/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../data/musica.dart';
import '../data/favoritos.dart';
import '../data/playlist.dart';
import '../detalhes/detalhes_da_musica.dart';
import '../detalhes/detalhes_do_artista.dart';
import '../detalhes/detalhes_do_album.dart';

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
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Bem-vindo de volta!",
              style: TextStyle(
                fontSize: 24,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          buildBody(isDarkMode, widget, 350),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: const Icon(Icons.brightness_medium),
      ),
    );
  }
}

Widget buildBody(isDarkMode, widget, listHeight) {
  return Container(
    color: isDarkMode ? Colors.black : Colors.white,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "Artistas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
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
                            print(widget.artistas[index].nome + 'pressed');
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetalhesDoArtistaScreen(
                                artista: widget.artistas[index],
                              ),
                            ),
                          );
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
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
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
            child: Center(
              child: Text(
                "Músicas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
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
                    title: Text(
                      widget.musicas[index].titulo,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      widget.musicas[index].artista.nome,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        _mostrarOpcoes(context, widget.musicas[index]);
                      },
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetalhesDaMusicaScreen(
                            musica: widget.musicas[index],
                          ),
                        ),
                      );
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

_mostrarOpcoes(BuildContext context, Musica musica) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Opções"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Detalhes do Artista"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetalhesDoArtistaScreen(
                        artista: musica.artista,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text("Detalhes da Música"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetalhesDaMusicaScreen(
                        musica: musica,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Álbum Correspondente"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetalhesDoAlbumScreen(
                        album: musica.album,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}*/


import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/detalhes/detalhes_da_musica.dart';
import 'package:Spotify/detalhes/detalhes_do_artista.dart';
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

  const Body({super.key, required this.artistas, required this.musicas, required this.favoritos, required this.playlist, required this.listHeight,});

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Bem-vindo de volta!",
              style: TextStyle(fontSize: 24, color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          buildBody(isDarkMode, widget, 350),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: const Icon(Icons.brightness_medium),
      ),
    );
  }
}

Widget buildBody(isDarkMode, widget, listHeight) {
  return Container(
    color: isDarkMode ? Colors.black : Colors.white, 
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "Artistas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black), 
              ),
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
                            print(widget.artistas[index].nome + 'pressed');
                          }
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDoArtistaScreen(artista: widget.artistas[index])));
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(widget.artistas[index].imagemUrl),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.artistas[index].nome,
                          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
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
            child: Center(
              child: Text(
                "Músicas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
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
                      backgroundImage: AssetImage(widget.musicas[index].capaUrl),
                    ),
                    title: Text(
                      widget.musicas[index].titulo,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    subtitle: Text(
                      widget.musicas[index].artista.nome,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
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
// ignore_for_file: use_super_parameters, library_private_types_in_public_api, non_constant_identifier_names

import 'package:spotify2/data/musica.dart';
import 'package:spotify2/detalhes/detalhes_do_artista.dart';
import 'package:spotify2/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/favoritos.dart'; // Importe os dados dos favoritos
import 'favoritos_tab.dart'; // Importe os dados dos favoritos

class FavoritosTab extends StatefulWidget {
  final List<Favorito> favoritos;
  final List<Musica> musica;

  const FavoritosTab({Key? key, required this.favoritos, required this.musica}) : super(key: key);

  @override
  _FavoritosTabState createState() => _FavoritosTabState();
}

class _FavoritosTabState extends State<FavoritosTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white, // Altera a cor de fundo com base no modo
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: FavoritosRow(context, widget.favoritos, isDarkMode, 10),
              ),
            ],
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        foregroundColor: isDarkMode ? Colors.white : Colors.grey,

        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: Icon(Icons.brightness_medium, color: !isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }
}

Widget FavoritosRow(BuildContext context, List<Favorito> favoritos, bool isDarkMode, double radiusInside) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 8),
      SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: favoritos.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //Avatar dos artistas
                  InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print(favoritos[index].artista.nome);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetalhesDoArtistaScreen(artista: favoritos[index].artista))
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radiusInside),
                      child: Image.asset(
                        favoritos[index].artista.imagemUrl,
                        width: 80,
                        height: 80,
                        
                        )
                    ),
                    
                  ),
                  //Nome dos artistas
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Text(
                      favoritos[index].artista.nome,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}



/*import 'package:flutter/material.dart';
import '../data/favoritos.dart'; // Importe os dados dos favoritos
import '../data/artistas.dart'; // Importe os dados dos artistas
import '../routes/detalhes_route.dart'; // Importe o gerenciador de rotas de detalhes
import 'package:aplicativo/detalhes/detalhes_do_artista.dart';

class FavoritosTab extends StatefulWidget {
  final List<Favorito> favoritos;

  FavoritosTab({Key? key, required this.favoritos}) : super(key: key);

  @override
  _FavoritosTabState createState() => _FavoritosTabState();
}

class _FavoritosTabState extends State<FavoritosTab> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favoritos",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Theme(
        data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
        child: FavoritosRow(context, widget.favoritos),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: Icon(Icons.brightness_medium),
      ),
    );
  }
}

Widget FavoritosRow(BuildContext context, List<Favorito> favoritos) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 8),
      SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: favoritos.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //Avatar dos artistas
                  InkWell(
                    onTap: () {
                      print(favoritos[index].artista.nome);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetalhesDoArtistaScreen(artista: favoritos[index].artista))
                      );
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(favoritos[index].artista.imagemUrl),
                    ),
                  ),
                  //Nome dos artistas
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Text(favoritos[index].artista.nome)
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
*/
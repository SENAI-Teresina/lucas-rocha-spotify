// ignore_for_file: use_super_parameters, unused_import

import 'package:Spotify/body.dart';
import 'package:Spotify/tabs/favoritos_tab.dart';
import 'package:flutter/material.dart';
import '../data/musica.dart';
import '../routes/detalhes_route.dart'; // Importe o gerenciador de rotas de detalhes
import 'package:Spotify/detalhes/detalhes_da_musica.dart';
import 'package:Spotify/detalhes/detalhes_do_artista.dart';
import '../data/favoritos.dart'; // Importe os dados dos favoritos
import '../data/artistas.dart'; // Importe os dados dos artistas// Importe o gerenciador de rotas de detalhes
import '../data/playlist.dart';

class BibliotecaTab extends StatefulWidget {
  final List<Favorito> favoritos;
  final List<Artista> artistas;
  final List<Musica> musicas;
  final List<Playlist> playlist;

  const BibliotecaTab({Key? key, required this.artistas, required this.musicas, required this.favoritos, required this.playlist}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BibliotecaTabState createState() => _BibliotecaTabState();
}

class _BibliotecaTabState extends State<BibliotecaTab> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: <Widget>[
          buildBody(isDarkMode, widget, 200),
          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    "Favoritos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
          ),
          FavoritosRow(context, widget.favoritos, isDarkMode, 50),
        ]
      ),
      // Container(
      //   color: isDarkMode ? Colors.black : Colors.white, // Altera a cor de fundo com base no modo
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         // Título "ARTISTAS"
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //           child: Center(
      //             child: Text(
      //               "Artistas",
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
      //             ),
      //           ),
      //         ),
      //         Container(height: 8, color: Colors.black,),
      //         Container(
      //           height: 140,
      //           child: ListView.builder(
      //             scrollDirection: Axis.horizontal,
      //             itemCount: widget.artistas.length,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 margin: const EdgeInsets.all(8.0),
      //                 child: Column(
      //                   children: <Widget>[
      //                     //Avatar dos artistas
      //                     InkWell(
      //                       onTap: () {
      //                         //Adicionar navegação
      //                         print(widget.artistas[index].nome + 'pressed');
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDoArtistaScreen(artista: widget.artistas[index])));
                              
      //                       },
      //                       child: CircleAvatar(
      //                         radius: 40,
      //                         backgroundImage: AssetImage(widget.artistas[index].imagemUrl),
      //                       ),
      //                     ),
      //                     //Nome dos artistas
      //                     Container(
      //                       margin: EdgeInsets.all(10.0),
      //                       child: Text(
      //                         widget.artistas[index].nome,
      //                         style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               );  
      //             },
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         // Exibindo as músicas
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //           child: Center(
      //             child: Text(
      //               "Músicas",
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 8),
      //         SizedBox(
      //           height: 200,
      //           child: ListView.builder(
      //             itemCount: widget.musicas.length,
      //             itemBuilder: (context, index) {
      //               return ListTile(
      //                 leading: CircleAvatar(
      //                     backgroundImage: AssetImage(widget.musicas[index].capaUrl),
      //                 ),
      //                 title: Text(
      //                   widget.musicas[index].titulo,
      //                   style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      //                 ),
      //                 subtitle: Text(
      //                   widget.musicas[index].artista.nome,
      //                   style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      //                 ),
      //                 onTap: () {
      //                   // Implementação da ação ao tocar em uma música
      //                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
      //                     DetalhesDaMusicaScreen(musica: widget.musicas[index])
      //                   ));
      //                 },
      //               );
      //             },
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //           child: Center(
      //             child: Text(
      //               "Favoritos",
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
      //             ),
      //           ),
      //         ),
      //         _buildFavoritosRow(context, widget.favoritos),
      //       ],
      //     ),
      //   ),
      // ),
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


/*import 'package:aplicativo/data/musica.dart';
import '../routes/detalhes_route.dart'; // Importe o gerenciador de rotas de detalhes
import 'package:aplicativo/detalhes/detalhes_da_musica.dart';
import 'package:aplicativo/detalhes/detalhes_do_artista.dart';
import 'package:aplicativo/tabs/favoritos_tab.dart';
import 'package:flutter/material.dart';
import '../data/favoritos.dart'; // Importe os dados dos favoritos
import '../data/artistas.dart'; // Importe os dados dos artistas// Importe o gerenciador de rotas de detalhes

class BibliotecaTab extends StatelessWidget {

  final List<Favorito> favoritos;
  final List<Artista> artistas;
  final List<Musica> musicas;
  //final double sizeW; 
  const BibliotecaTab({super.key, required this.artistas, required this.musicas, required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título "ARTISTAS"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "Artistas",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), // Negrito
              ),
            ),
          ),
          Container(height: 8, color: Colors.black,),
          Container(
            //color: Colors.red,
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artistas.length,
              itemBuilder: (context, index) {
                return 
                //Padding(
                //  padding: const EdgeInsets.all(8.0),
                //  child: 
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        //Avatar dos artistas
                        InkWell(
                          onTap: () {
                            //Adicionar navegação
                            print(artistas[index].nome + 'pressed');
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DetalhesDoArtistaScreen(artista: artistas[index]))
                            );
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(artistas[index].imagemUrl),
                          ),
                        ),
                        //Nome dos artistas
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Text(artistas[index].nome)
                        ),
                      ],
                    ),
                  );  
                //);
              },
            ),
          ),
          const SizedBox(height: 16),
          // Exibindo as músicas
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "Músicas",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: musicas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(musicas[index].capaUrl),
                  ),
                  title: Text(musicas[index].titulo),
                  subtitle: Text(musicas[index].artista.nome),
                  onTap: () {
                    //print(musicas[index]);
                    // Implementação da ação ao tocar em uma música
                    // Exemplo: abrir a música em outra tela
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                      DetalhesDaMusicaScreen(musica: musicas[index])
                    ));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesMusica(musica: musicas[index])));
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "Favoritos",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FavoritosRow(context, favoritos)
        ],
      ),
    );
  }
}
*/
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




/*import 'package:aplicativo/detalhes/detalhes_da_musica.dart';
import 'package:aplicativo/detalhes/detalhes_do_artista.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../data/artistas.dart'; // Importe os dados dos artistas
import '../data/musica.dart'; // Importe os dados das músicas
import '../data/favoritos.dart'; // Importe os dados dos favoritos

class Body extends StatelessWidget {
  final List<Artista> artistas;
  final List<Musica> musicas;
  final List<Favorito> favoritos;

  const Body({Key? key, required this.artistas, required this.musicas, required this.favoritos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Bem-vindo de volta!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Título "ARTISTAS"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "Artistas",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // Negrito
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDoArtistaScreen(artista: artistas[index])));
                            
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
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 400,
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
          const SizedBox(height: 16),
          // Exibindo os favoritos
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Text(
          //     "Favoritos",
          //     style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // const SizedBox(height: 8),
          // SizedBox(
          //   height: 140,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: favoritos.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //           margin: const EdgeInsets.all(8.0),
          //           child: Column(
          //             children: <Widget>[
          //               //Avatar dos artistas
          //               CircleAvatar(
          //                 radius: 40,
          //                 backgroundImage: AssetImage(favoritos[index].imagemUrl),
          //               ),
          //               //Nome dos artistas
          //               Container(
          //                 margin: EdgeInsets.all(10.0),
          //                 child: Text(favoritos[index].nome)
          //               ),
          //             ],
          //           ),
          //         );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
*/
import 'package:Spotify/data/playlist.dart';
import 'package:Spotify/detalhes/detalhes_da_playlist.dart';
import 'package:Spotify/main.dart';
import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../data/musica.dart';
import '../detalhes/detalhes_da_musica.dart'; 

class DetalhesDoArtistaScreen extends StatefulWidget {
  final Artista artista;

  const DetalhesDoArtistaScreen({Key? key, required this.artista}) : super(key: key);

  @override
  _DetalhesDoArtistaScreenState createState() => _DetalhesDoArtistaScreenState();
}

class _DetalhesDoArtistaScreenState extends State<DetalhesDoArtistaScreen> {

  @override
  Widget build(BuildContext context) {
    List<Musica> musicasDoArtista = musicas.where((musica) => musica.artista == widget.artista).toList();

    
    List<Playlist> playlistComArtista = playlists.where((playlist) {
     return playlist.musicas.where((musica) => musica.artista == widget.artista).toList().isNotEmpty;
    }).toList();
    print(playlistComArtista);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Artista"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!, 
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.artista.imagemUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.artista.nome,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                "Informações do Artista:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.artista.descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Curiosidades do Artista:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.artista.curiosidade,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Álbuns e Playlist:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: playlistComArtista.map((playlist) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesDaPlaylistScreen(playlist: playlist),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          const SizedBox(width: 20),
                          // Container(
                          //   width: 100,
                          //   height: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
                          //   ),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(10),
                          //     child: Image.asset(
                          //       musica.capaUrl,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              playlist.titulo,
                              style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Músicas:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 10),
              Container(
                height: 125,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: musicasDoArtista.length,
                  itemBuilder: (BuildContext context, int index) {
                    final musica = musicasDoArtista[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesDaMusicaScreen(musica: musica,),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                musica.capaUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              musica.titulo,
                              style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}


// import 'package:Spotify/main.dart';
// import 'package:flutter/material.dart';
// import '../data/artistas.dart';
// import '../data/musica.dart'; 
// import 'detalhes_da_musica.dart'; 

// class DetalhesDoArtistaScreen extends StatefulWidget {
//   final Artista artista;

//   const DetalhesDoArtistaScreen({Key? key, required this.artista}) : super(key: key);

//   @override
//   _DetalhesDoArtistaScreenState createState() => _DetalhesDoArtistaScreenState();
// }

// class _DetalhesDoArtistaScreenState extends State<DetalhesDoArtistaScreen> {

//   @override
//   Widget build(BuildContext context) {
//     List<Musica> musicasDoArtista = musicas.where((musica) => musica.artista == widget.artista).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Detalhes do Artista"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 isDarkMode = !isDarkMode;
//               });
//             },
//             icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 150,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!, 
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     widget.artista.imagemUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 widget.artista.nome,
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "Informações do Artista:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   widget.artista.descricao,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "Curiosidades do Artista:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   widget.artista.curiosidade,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 "Músicas:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
//               ),
//               Container(child: ListView.builder(
//                 itemCount: musicasDoArtista.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(musicasDoArtista[index].capaUrl),
//                     ),
//                     title: Text(
//                       musicasDoArtista[index].titulo,
//                       style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//                     ),
//                     subtitle: Text(
//                       musicasDoArtista[index].artista.nome,
//                       style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//                     ),
//                     trailing: MenuAnchor(
//                       builder: (BuildContext context, MenuController controller, Widget? child) {
//                         return IconButton(
//                           onPressed: () {
//                             if (controller.isOpen) {
//                               controller.close();
//                             } else {
//                               controller.open();
//                             }
//                           },
//                           icon: Icon(Icons.more_horiz, color: isDarkMode ? Colors.white : Colors.black), 
//                           tooltip: 'Show menu',
//                         );
//                       },
//                       menuChildren: List<MenuItemButton>.generate(
//                         2,
//                         (int index) => MenuItemButton(
//                           onPressed: () {},
//                               //setState(() => selectedMenu = SampleItem.values[index]),
//                           child: Text(' '),
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDaMusicaScreen(musica: musicasDoArtista[index])));
//                     },
//                   );
//                 },
//               ),),
//               // const SizedBox(height: 10),
//               // SingleChildScrollView(
//               //   scrollDirection: Axis.horizontal,
//               //   child: Row(
//               //     children: musicasDoArtista.map((musica) {
//               //       return GestureDetector(
//               //         onTap: () {
//               //           Navigator.pop(context);
//               //           Navigator.push(
//               //             context,
//               //             MaterialPageRoute(
//               //               builder: (context) => DetalhesDaMusicaScreen(musica: musica),
//               //             ),
//               //           );
//               //         },
//               //         child: Column(
//               //           children: [
//               //             const SizedBox(width: 20),
//               //             Container(
//               //               width: 150,
//               //               height: 150,
//               //               decoration: BoxDecoration(
//               //                 borderRadius: BorderRadius.circular(10),
//               //                 color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
//               //               ),
//               //               child: ClipRRect(
//               //                 borderRadius: BorderRadius.circular(10),
//               //                 child: Image.asset(
//               //                   musica.capaUrl,
//               //                   fit: BoxFit.cover,
//               //                 ),
//               //               ),
//               //             ),
//               //             const SizedBox(height: 10),
//               //             Padding(
//               //               padding: const EdgeInsets.symmetric(horizontal: 20),
//               //               child: Text(
//               //                 musica.titulo,
//               //                 style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline),
//               //                 textAlign: TextAlign.center,
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       );
//               //     }).toList(),
//               //   ),
//               // ),
//               const SizedBox(height: 20),
//               Text(
//                 "Álbuns e Playlist:",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
//               ),
//               const SizedBox(height: 10),
//             ]
//           ),
//         ),
//       ),
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//     );
//   }
// }

// // SingleChildScrollView(
// //                 scrollDirection: Axis.vertical,
// //                 child: ListView.builder(
// //                   itemCount: musicasDoArtista.length,
// //                   itemBuilder: (BuildContext context, int index) {
// //                     return ListTile(
// //                     leading: CircleAvatar(
// //                       backgroundImage: AssetImage(musicasDoArtista[index].capaUrl),
// //                     ),
// //                     title: Text(
// //                       musicasDoArtista[index].titulo,
// //                       style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
// //                     ),
// //                     subtitle: Text(
// //                       musicasDoArtista[index].artista.nome,
// //                       style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
// //                     ),
// //                     onTap: () {
// //                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetalhesDaMusicaScreen(
// //                         musica: musicasDoArtista[index])));
// //                     },
// //                   );
// //                 })
                
// //                 // Column(
// //                 //   children: musicasDoArtista.map((musica) {
// //                 //     return GestureDetector(
// //                 //       onTap: () {
// //                 //         Navigator.pop(context);
// //                 //         Navigator.push(
// //                 //           context,
// //                 //           MaterialPageRoute(
// //                 //             builder: (context) => DetalhesDaMusicaScreen(musica: musica),
// //                 //           ),
// //                 //         );
// //                 //       },
// //                 //       child:  ListTile(
// //                 //         title: Text(),
// //                 //       ) 

// //                       // Column(
// //                       //   children: [
// //                       //     const SizedBox(width: 20),
// //                       //     Container(
// //                       //       width: 150,
// //                       //       height: 150,
// //                       //       decoration: BoxDecoration(
// //                       //         borderRadius: BorderRadius.circular(10),
// //                       //         color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
// //                       //       ),
// //                       //       child: ClipRRect(
// //                       //         borderRadius: BorderRadius.circular(10),
// //                       //         child: Image.asset(
// //                       //           musica.capaUrl,
// //                       //           fit: BoxFit.cover,
// //                       //         ),
// //                       //       ),
// //                       //     ),
// //                       //     const SizedBox(height: 10),
// //                       //     Padding(
// //                       //       padding: const EdgeInsets.symmetric(horizontal: 20),
// //                       //       child: Text(
// //                       //         musica.titulo,
// //                       //         style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline),
// //                       //         textAlign: TextAlign.center,
// //                       //       ),
// //                       //     ),
// //                       //   ],
// //                       // ),
// //                     //);
// //                  // }).toList(),
// //                 ),
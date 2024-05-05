import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../data/musica.dart';
import 'detalhes_da_musica.dart'; 

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Artista"),
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
                  color: Colors.grey[200]!,
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Músicas:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: musicasDoArtista.length,
                itemBuilder: (BuildContext context, int index) {
                  final musica = musicasDoArtista[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesDaMusicaScreen(musica: musica),
                        ),
                      );
                    },
                    title: Text(
                      musica.titulo,
                      style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:spotify2/main.dart';
// import '../data/artistas.dart';
// import '../data/musica.dart'; 
// import '../detalhes/detalhes_da_musica.dart'; 

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
//               const SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: musicasDoArtista.map((musica) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetalhesDaMusicaScreen(musica: musica),
//                           ),
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           const SizedBox(width: 20),
//                           Container(
//                             width: 150,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                 musica.capaUrl,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Text(
//                               musica.titulo,
//                               style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../data/musica.dart'; // Suponha que Musica seja sua classe de dados para representar uma música

// class LetrasDasMusicasScreen extends StatelessWidget {
//   final List<Musica> musicas; // Suponha que você tenha uma lista de objetos de música

//   const LetrasDasMusicasScreen({Key? key, required this.musicas}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Letras das Músicas'),
//       ),
//       body: ListView.builder(
//         itemCount: musicas.length,
//         itemBuilder: (context, index) {
//           Musica musica = musicas[index];
//           return ListTile(
//             title: Text(musica.titulo),
//             onTap: () {
//               _mostrarLetraDaMusica(context, musica);
//             },
//           );
//         },
//       ),
//     );
//   }

//   void _mostrarLetraDaMusica(BuildContext context, Musica musica) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(musica.titulo),
//           content: SingleChildScrollView(
//             child: Text(
//               musica.letraDaMusica,
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Fechar'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:Spotify/tabs/playlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:Spotify/data/artistas.dart'; // Importe os dados dos artistas
import 'package:Spotify/data/musica.dart'; // Importe os dados das músicas
import 'package:Spotify/data/favoritos.dart'; // Importe os dados dos favoritos
import 'package:Spotify/data/playlist.dart';
import '../body.dart';
import '../tabs/biblioteca_aba.dart';
import '../tabs/favoritos_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4, // Número de abas
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Spotify",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Expanded(child: Container()), // Adiciona espaço para que os elementos fiquem no lado direito
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/usuario/Luska.jpg'), // Substitua pela imagem de perfil do usuário
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Usuário', // Substitua pelo nome do usuário
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Nível da Conta: Premium', // Substitua pelo nível da conta do usuário
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.explore, color: isDarkMode ? Colors.white : Colors.green[600]),
                      const SizedBox(width: 5),
                      const Text(
                        "Explorar",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: isDarkMode ? Colors.white : Colors.green[600]),
                      const SizedBox(width: 5),
                      const Text(
                        "Favoritos",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.playlist_add, color: isDarkMode ? Colors.white : Colors.green[600]),
                      const SizedBox(width: 5),
                      const Text(
                        "Álbuns e Playlist",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dynamic_feed_sharp, color: isDarkMode ? Colors.white : Colors.green[600]),
                      const SizedBox(width: 5),
                      const Text(
                        "Biblioteca",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Body(artistas: artistas, musicas: musicas, favoritos: favoritos, playlist: playlist, listHeight: 400),
              FavoritosTab(favoritos: favoritos),
              PlaylistTab(playlist: playlist),
              BibliotecaTab(artistas: artistas, musicas: musicas, playlist: playlist, favoritos: favoritos,),
            ],
          ),
          // Drawer
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/usuario/Luska.jpg'), // Substitua pela imagem de perfil do usuário
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Luska Biel', // Substitua pelo nome do usuário
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Nível da Conta: Premium', // Substitua pelo nível da conta do usuário
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                  ),
                ),
                ListTile(
                  title: const Text('Minha Conta'),
                  onTap: () {
                    // Adicione a lógica para a tela "Minha Conta" aqui
                  },
                ),
                ListTile(
                  title: const Text('Sobre Nós'),
                  onTap: () {
                    // Adicione a lógica para a tela "Sobre Nós" aqui
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
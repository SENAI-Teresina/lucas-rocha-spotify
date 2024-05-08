import 'package:flutter/material.dart';
import 'package:Spotify/tabs/playlist_tab.dart';
import 'package:Spotify/data/artistas.dart'; // Importe os dados dos artistas
import 'package:Spotify/data/musica.dart'; // Importe os dados das músicas
import 'package:Spotify/data/favoritos.dart'; // Importe os dados dos favoritos
import 'package:Spotify/data/playlist.dart';
import '../body.dart';
import '../tabs/biblioteca_aba.dart';
import '../tabs/favoritos_tab.dart';

bool isDarkMode = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMobileView = false;
  bool isTabletView = false;

  void _setMobileView() {
    setState(() {
      isMobileView = true;
      isTabletView = false;
    });
  }

  void _setTabletView() {
    setState(() {
      isMobileView = false;
      isTabletView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text(
                      "Spotify",
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/usuario/Luska.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Luska Biel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Nível da Conta: Premium',
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
                  Body(artistas: artistas, musicas: musicas, favoritos: favoritos, playlist: playlists, listHeight: 400),
                  FavoritosTab(favoritos: favoritos, musica: musicas,),
                  PlaylistTab(playlist: playlists),
                  BibliotecaTab(artistas: artistas, musicas: musicas, playlist: playlists, favoritos: favoritos,),
                ],
              ),
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
                                backgroundImage: AssetImage('assets/usuario/Luska.jpg'),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Luska Biel',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Nível da Conta: Premium',
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
                        openAboutUsPage(context); // Abre a página "Sobre Nós"
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Função para navegar para a página "Sobre Nós"
void openAboutUsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AboutUsPage()),
  );
}

// Página "Sobre Nós"
class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('Sobre Nós'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            'Quem somos:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Somos uma equipe apaixonada por música e tecnologia, comprometida em oferecer a melhor experiência de streaming de música para nossos usuários.',
            style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.white : Colors.black),
          ),
          SizedBox(height: 20.0),
          Text(
            'Missão:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Nossa missão é democratizar o acesso à música, proporcionando uma ampla variedade de conteúdo musical de qualidade para todos os gostos e estilos.',
            style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.white : Colors.black),
          ),
          SizedBox(height: 20.0),
          Text(
            'Valores:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '1. Excelência: Buscamos sempre a excelência em tudo o que fazemos, desde a seleção de músicas até a experiência do usuário.',
            style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.white : Colors.black),
          ),
          Text(
            '2. Inovação: Estamos constantemente inovando e buscando maneiras de melhorar e aprimorar nossa plataforma.',
            style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.white : Colors.black),
          ),
          Text(
            '3. Diversidade: Valorizamos a diversidade e a inclusão, oferecendo uma ampla gama de músicas e artistas de diferentes culturas e origens.',
            style: TextStyle(fontSize: 20, color: isDarkMode ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
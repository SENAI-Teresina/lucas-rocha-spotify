import 'package:flutter/material.dart';
import 'explorar_tab.dart';
import 'favoritos_tab.dart';
import 'recentes_tab.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Spotify'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.explore),
                text: 'Explorar',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favoritos',
              ),
              Tab(
                icon: Icon(Icons.access_time),
                text: 'Recentes',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ExplorarTab(),
            // FavoritosTab(),
            RecentesTab(),
          ],
        ),
      ),
    );
  }
}

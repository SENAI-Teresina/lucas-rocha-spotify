import 'package:flutter/material.dart';
import '../data/artistas.dart';
import '../detalhes/detalhes_do_artista.dart'; // Importe a tela de detalhes do artista

class DetalhesRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/detalhes':
        // Verifica se os argumentos são do tipo esperado
        if (settings.arguments != null && settings.arguments is Artista) {
          // Converte os argumentos para um objeto Artista
          final Artista artista = settings.arguments as Artista;
          return MaterialPageRoute(builder: (_) => DetalhesDoArtistaScreen(artista: artista));
        } else {
          // Se os argumentos não forem válidos, retorna para a rota de erro
          return _erroRota();
        }
      default:
        // Se a rota não for encontrada, retorna para a rota de erro
        return _erroRota();
    }
  }

  // Função para rota de erro
  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erro')),
        body: const Center(child: Text('Rota não encontrada')),
      ),
    );
  }
}

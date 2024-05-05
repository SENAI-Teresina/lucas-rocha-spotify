import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nós'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Text(
            'Quem somos:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Somos uma equipe apaixonada por música e tecnologia, comprometida em oferecer a melhor experiência de streaming de música para nossos usuários.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          Text(
            'Missão:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Nossa missão é democratizar o acesso à música, proporcionando uma ampla variedade de conteúdo musical de qualidade para todos os gostos e estilos.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          Text(
            'Valores:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '1. Excelência: Buscamos sempre a excelência em tudo o que fazemos, desde a seleção de músicas até a experiência do usuário.',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            '2. Inovação: Estamos constantemente inovando e buscando maneiras de melhorar e aprimorar nossa plataforma.',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            '3. Diversidade: Valorizamos a diversidade e a inclusão, oferecendo uma ampla gama de músicas e artistas de diferentes culturas e origens.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

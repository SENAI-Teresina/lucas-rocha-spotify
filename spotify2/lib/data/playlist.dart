import 'package:spotify2/data/musica.dart';

class Playlist {
  final String titulo;
  final String artista;
  final String capaUrl;
  final List<Musica> musicas;

  Playlist({required this.titulo, required this.artista, required this.capaUrl, required this.musicas});
}

List<Playlist> playlist = [
  Playlist(titulo: 'nome', artista: 'Felipe Amorim', capaUrl: 'assets/capa/eu.jpg', musicas: [
    musicas[0]
  ])
];

// import 'package:just_audio/just_audio.dart';
// import 'package:Spotify/data/musica.dart';

// class Playlist {
//   final String titulo;
//   final String artista;
//   final String capaUrl;
//   final List<Musica> musicas;
//   late AudioPlayer _audioPlayer;
//   late int _currentIndex;

//   Playlist({
//     required this.titulo,
//     required this.artista,
//     required this.capaUrl,
//     required this.musicas,
//   }) {
//     _audioPlayer = AudioPlayer();
//     _currentIndex = 0;
//     _audioPlayer.playerStateStream.listen((playerState) {
//       if (playerState.processingState == ProcessingState.completed) {
//         if (_currentIndex < musicas.length - 1) {
//           _currentIndex++;
//           _playMusic(musicas[_currentIndex].mp3Url);
//         } else {
//           // Playlist reached the end, you can handle what to do here
//           // For example, stop playing or loop the playlist
//         }
//       }
//     });
//   }

//   void _playMusic(String url) async {
//     await _audioPlayer.setUrl(url);
//     await _audioPlayer.play();
//   }

//   void play() {
//     _playMusic(musicas[_currentIndex].mp3Url);
//   }

//   void pause() {
//     _audioPlayer.pause();
//   }

//   void stop() {
//     _audioPlayer.stop();
//   }
// }
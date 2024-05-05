import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _artistName = "";
  List<String> _artistPictures = [];
  List<String> _trackTitles = [];
  List<String> _albumImages = [];
  List<String> _trackUrls = [];
  TextEditingController _searchController = TextEditingController();
  AudioPlayer _audioPlayer = AudioPlayer();
  int _currentTrackIndex = -1;
  Duration _currentPosition = Duration.zero;
  bool _isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  Future<void> buscarArtistas(String artista) async {
    final String apiUrl = "https://deezerdevs-deezer.p.rapidapi.com/search?q=$artista";
    final Map<String, String> headers = {
      "x-rapidapi-host": "deezerdevs-deezer.p.rapidapi.com",
      "x-rapidapi-key": "a9b2a659d9msh72c3634862390e2p1f856ejsn62022b3ffa9a"
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _artistName = data['data'][0]['artist']['name'];
        _artistPictures = List<String>.generate(10, (index) => data['data'][index]['artist']['picture_medium']);
        _trackTitles = List<String>.generate(10, (index) => data['data'][index]['title']);
        _albumImages = List<String>.generate(10, (index) => data['data'][index]['album']['cover_medium']);
        _trackUrls = List<String>.generate(10, (index) => data['data'][index]['preview']);
      });
    } else {
      throw Exception('Failed to load artists');
    }
  }

  Future<void> _playMusic(int index) async {
    String trackUrl = _trackUrls[index];
    int result = await _audioPlayer.play(trackUrl, position: _currentPosition, isLocal: false);

    if (result == 1) {
      setState(() {
        _currentTrackIndex = index;
        _isPlaying = true;
      });
      print('Música reproduzida com sucesso');
    } else {
      print('Falha ao reproduzir a música');
    }

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _currentPosition = duration;
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      if (state == AudioPlayerState.COMPLETED) {
        setState(() {
          _isPlaying = false;
          _currentPosition = Duration.zero;
        });
      }
    });
  }

  void _pauseMusic() async {
  await _audioPlayer.pause();
  setState(() {
    _isPlaying = false;
  });
  _audioPlayer.onDurationChanged.listen((duration) {
    setState(() {
      _currentPosition = duration;
    });
  });
}


  void _nextTrack() {
    if (_currentTrackIndex < _trackUrls.length - 1) {
      int nextTrackIndex = _currentTrackIndex + 1;
      _audioPlayer.stop();
      _playMusic(nextTrackIndex);
    } else {
      print('Esta é a última faixa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deezer API Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Digite o nome do artista',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    String artist = _searchController.text;
                    buscarArtistas(artist);
                  },
                  child: Text('Buscar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _trackTitles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(_albumImages[index]),
                  title: Text(_trackTitles[index]),
                  tileColor: index == _currentTrackIndex ? Colors.blue[100] : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: _isPlaying && index == _currentTrackIndex ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                        onPressed: () {
                          if (_isPlaying && index == _currentTrackIndex) {
                            _pauseMusic();
                          } else {
                            _playMusic(index);
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next),
                        onPressed: () {
                          _nextTrack();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

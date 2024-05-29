import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/musica.dart';
import '../data/artistas.dart';
import '../main.dart';
import 'detalhes_do_artista.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class DetalhesDaMusicaScreen extends StatefulWidget {
  final Musica musica;
  final double sizeImage = 350;

  const DetalhesDaMusicaScreen({Key? key, required this.musica}) : super(key: key);

  @override
  _DetalhesDaMusicaScreenState createState() => _DetalhesDaMusicaScreenState();
}

class _DetalhesDaMusicaScreenState extends State<DetalhesDaMusicaScreen> with SingleTickerProviderStateMixin {
  late AudioPlayer player;
  bool isLooping = false;
  bool isMuted = false;
  Duration? currentPlaybackPosition;
  Duration? duration;
  double maxSliderValue = 0;

  double volumeLevel = 1.0;
  bool editingVolumeLevel = true;
  double editingVolumeSliderValue = 0;

  bool get isPlaying => player.state == PlayerState.playing;

  bool editingPlayer = false;
  double editingSliderValue = 0;

  late TabController _tabController;

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        setState(() {
          currentPlaybackPosition = null;
        });
      }
    });

    player.onPositionChanged.listen((Duration duration) {
      setState(() {
        currentPlaybackPosition = duration;
      });
    });

    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        maxSliderValue = duration!.inSeconds.toDouble();
      });
    });

    _initAudioPlayer();

    _tabController = TabController(length: 2, vsync: this);

    _videoController = VideoPlayerController.asset(widget.musica.letraDaMusica)
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().catchError((error) {
        print('Erro ao inicializar o controlador de vídeo: $error');
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    player.dispose();
    _videoController.dispose();
    super.dispose();
  }

  void _initAudioPlayer() async {
    final file = File(widget.musica.mp3Url);
    if (await file.exists()) {
      await player.setSourceUrl(widget.musica.mp3Url);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? savedPosition = prefs.getInt('saved_position_${widget.musica.titulo}');
      if (savedPosition != null) {
        await player.seek(Duration(seconds: savedPosition));
      }

      Timer.periodic(Duration(milliseconds: 500), (timer) async {
        if (player.state == PlayerState.playing) {
          Duration? position = await player.getCurrentPosition();
          setState(() {
            currentPlaybackPosition = position;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPlaybackPosition) {
      case null:
        editingSliderValue = 0;
        break;
      default:
        if (!editingPlayer) {
          editingSliderValue = currentPlaybackPosition!.inSeconds.toDouble();
        }
        break;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            _stop();
          },
        ),
        title: const Text("Detalhes da Música"),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Áudio da Música"),
            Tab(text: "Vídeo Clipe da Música"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Primeiro slot: Áudio da Música
          Container(
            child: Stack(
              children: [
                Container(
                  color: isDarkMode ? Colors.black : Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: widget.sizeImage,
                          height: widget.sizeImage,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isDarkMode ? Colors.black : Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.musica.capaUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.musica.titulo,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesDoArtistaScreen(artista: widget.musica.artista),
                              ),
                            );
                            _stop();
                          },
                          child: Text(
                            "Artista: ${widget.musica.artista.nome}",
                            style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.white,
                            activeTrackColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,
                          ),
                          child: Slider(
                            min: 0,
                            max: maxSliderValue,
                            value: editingSliderValue,
                            onChanged: (value) {
                              editingSliderValue = value;
                            },
                            onChangeStart: (value) => {editingPlayer = true},
                            onChangeEnd: (value) => {
                              editingPlayer = false,
                              currentPlaybackPosition = Duration(seconds: value.round()),
                              player.seek(Duration(seconds: currentPlaybackPosition!.inSeconds)),
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentPlaybackPosition != null
                                  ? '${currentPlaybackPosition!.inMinutes}:${(currentPlaybackPosition!.inSeconds % 60)}'
                                  : '0:00',
                              style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            SizedBox(width: 20),
                            Text(
                              duration != null ? '${duration!.inMinutes}:${(duration!.inSeconds % 60)}' : '0:00',
                              style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: _playOrPause,
                              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            IconButton(
                              onPressed: _skipBackward,
                              icon: Icon(Icons.replay_5, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            IconButton(
                              onPressed: _skipForward,
                              icon: Icon(Icons.forward_5, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            IconButton(
                              onPressed: _toggleLooping,
                              icon: Icon(isLooping ? Icons.repeat_one : Icons.repeat, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            IconButton(
                              onPressed: _toggleMute,
                              icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            IconButton(
                              onPressed: _decreaseVolume,
                              icon: Icon(Icons.volume_down, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            IconButton(
                              onPressed: _increaseVolume,
                              icon: Icon(Icons.volume_up, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              child: Visibility(
                                visible: !isMuted,
                                child: Slider(
                                  min: 0,
                                  max: 1,
                                  value: volumeLevel,
                                  activeColor: isDarkMode ? Colors.white : Colors.black,
                                  inactiveColor: Colors.grey,
                                  onChanged: (value) {
                                    setState(() {
                                      volumeLevel = value;
                                      player.setVolume(volumeLevel);
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Segundo slot: Vídeo Clipe da Música
          _videoController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _stop() {
    player.stop();
  }

  void _playOrPause() async {
    if (isPlaying) {
      await player.pause();
      _videoController.pause();
    } else {
      if (player.state == PlayerState.paused) {
        await player.resume();
        _videoController.play();
      } else {
        await player.play(UrlSource(widget.musica.mp3Url));
        _videoController.play();
      }
    }
  }

  void _skipBackward() {
    if (currentPlaybackPosition != null) {
      int newPosition = currentPlaybackPosition!.inSeconds - 5;
      if (newPosition < 0) {
        newPosition = 0;
      }
      player.seek(Duration(seconds: newPosition));
    }
  }

  void _skipForward() {
    if (currentPlaybackPosition != null && duration != null) {
      int newPosition = currentPlaybackPosition!.inSeconds + 5;
      if (newPosition > duration!.inSeconds) {
        newPosition = duration!.inSeconds;
      }
      player.seek(Duration(seconds: newPosition));
    }
  }

  void _toggleLooping() {
    setState(() {
      isLooping = !isLooping;
      player.setReleaseMode(isLooping ? ReleaseMode.loop : ReleaseMode.stop);
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
      player.setVolume(isMuted ? 0.0 : volumeLevel);
      _videoController.setVolume(isMuted ? 0.0 : 1.0);
    });
  }

  void _increaseVolume() {
    isMuted = false;
    setState(() {
      if (volumeLevel < 1.0) {
        volumeLevel += volumeLevel + 0.1 > 1 ? 1 - volumeLevel : 0.1;
        player.setVolume(volumeLevel);
        _videoController.setVolume(volumeLevel);
      }
    });
  }

  void _decreaseVolume() {
    if (!isMuted) {
      setState(() {
        if (volumeLevel > 0.0) {
          volumeLevel -= volumeLevel - 0.1 < 0 ? volumeLevel : 0.1;
          player.setVolume(volumeLevel);
          _videoController.setVolume(volumeLevel);
        }
      });
    }
  }
}
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

class AudioPlayerService extends BackgroundAudioTask {
  final _player = AudioPlayer();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    // Configura o audio_service
    await AudioServiceBackground.setState(
      controls: [
        MediaControl.skipToPrevious,
        MediaControl.pause,
        MediaControl.stop,
        MediaControl.play,
        MediaControl.skipToNext,
      ],
      processingState: AudioProcessingState.ready,
      playing: true,
    );

    // Inicializa o player de áudio
    await _player.setUrl(params!['url']);
    await _player.play();
    _player.processingStateStream.listen((state) {
      switch (state) {
        case ProcessingState.completed:
          AudioServiceBackground.setState(
            controls: [],
            processingState: AudioProcessingState.completed,
            playing: false,
          );
          break;
        case ProcessingState.buffering:
          AudioServiceBackground.setState(
            controls: [],
            processingState: AudioProcessingState.buffering,
            playing: true,
          );
          break;
        case ProcessingState.ready:
          AudioServiceBackground.setState(
            controls: [
              MediaControl.skipToPrevious,
              MediaControl.pause,
              MediaControl.stop,
              MediaControl.play,
              MediaControl.skipToNext,
            ],
            processingState: AudioProcessingState.ready,
            playing: true,
          );
          break;
        default:
          break;
      }
    }, onError: (Object error, StackTrace stackTrace) {
      // Lidar com erros do stream de processamento
      print('Erro no stream de processamento: $error');
    });
  }

  @override
  Future<void> onPlay() => _player.play();

  @override
  Future<void> onPause() => _player.pause();

  @override
  Future<void> onStop() => _player.stop();

  @override
  Future<void> onSkipToNext() async {
    // Implementação para ir para a próxima música
  }

  @override
  Future<void> onSkipToPrevious() async {
    // Implementação para voltar para a música anterior
  }
}

import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class CallingRandom {
  final List<String> audios = [
    'audio/list/1.mp3',
    'audio/list/2.mp3',
    'audio/list/3.mp3',
    'audio/list/4.mp3',
  ];

  Timer? _timer;
  final Random _random = Random();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void callingUnder20() {
    _timer?.cancel();

    _timer = Timer(const Duration(seconds: 20), () {
      _playRandomAudio();
    });
  }

  Future<void> _playRandomAudio() async {
    final randomAudio = audios[_random.nextInt(audios.length)];
    await _audioPlayer.play(AssetSource(randomAudio));
  }

  Future<void> callBreak() async {
    _timer?.cancel();

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audio/unavaible.mp3'));
  }

  void clean() {
    _timer?.cancel();
    _audioPlayer.dispose();
  }
}

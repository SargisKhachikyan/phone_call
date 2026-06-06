import 'package:audioplayers/audioplayers.dart';

class OneTapAudio {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio() async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audio/typing_one_final_audio.mp3'));
  }
}

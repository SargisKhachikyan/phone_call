import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/state/phone_bloc_events.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/state/phone_bloc_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final List<String> _audios = [
    'audio/list/1.mp3',
    'audio/list/2.mp3',
    'audio/list/3.mp3',
    'audio/list/4.mp3',
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();
  final Random _random = Random();

  Timer? _timer;

  PhoneBloc()
      : super(
          const PhoneState(
            digits: '',
          ),
        ) {
    on<AddPhoneField>(_onAddPhoneField);
    on<ClearPhoneField>(_onClearPhoneField);
    on<PlayRandomAudio>(_onPlayRandomAudio);
    on<PlayUnder20>(_onPlayUnder20);
    on<StopAudio>(_onStopAudio);
    on<CleanAudio>(_onCleanAudio);
  }

  void _onAddPhoneField(
    AddPhoneField event,
    Emitter<PhoneState> emit,
  ) {
    emit(
      state.copyWith(
        digits: state.digits + event.digit,
      ),
    );
  }

  void _onClearPhoneField(
    ClearPhoneField event,
    Emitter<PhoneState> emit,
  ) {
    emit(
      state.copyWith(digits: ''),
    );
  }

  Future<void> _onPlayRandomAudio(
    PlayRandomAudio event,
    Emitter<PhoneState> emit,
  ) async {
    final audio = _audios[_random.nextInt(_audios.length)];

    await _audioPlayer.play(AssetSource(audio));

    emit(
      state.copyWith(audioPath: audio),
    );
  }

  Future<void> _onPlayUnder20(
    PlayUnder20 event,
    Emitter<PhoneState> emit,
  ) async {
    _timer?.cancel();

    _timer = Timer(
      const Duration(seconds: 20),
      () {
        add(PlayRandomAudio());
      },
    );
  }

  Future<void> _onStopAudio(
    StopAudio event,
    Emitter<PhoneState> emit,
  ) async {
    _timer?.cancel();

    const audio = 'audio/unavaible.mp3';

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audio));

    emit(
      state.copyWith(audioPath: audio),
    );
  }

  Future<void> _onCleanAudio(
    CleanAudio event,
    Emitter<PhoneState> emit,
  ) async {
    _timer?.cancel();
    await _audioPlayer.stop();

    emit(
      state.copyWith(audioPath: null),
    );
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    await _audioPlayer.dispose();
    return super.close();
  }
}

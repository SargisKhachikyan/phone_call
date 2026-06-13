abstract class PhoneEvent {}

class AddPhoneField extends PhoneEvent {
  final String digit;
  AddPhoneField(this.digit);
}

class ClearPhoneField extends PhoneEvent {}

class PlayRandomAudio extends PhoneEvent {}

class PlayUnder20 extends PhoneEvent {}

class StopAudio extends PhoneEvent {}

class CleanAudio extends PhoneEvent {}
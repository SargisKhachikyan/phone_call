abstract class PhoneEvent {}

class AddPhoneField extends PhoneEvent {
  final String digit;

  AddPhoneField(this.digit);
}

class ClearPhoneField extends PhoneEvent {}

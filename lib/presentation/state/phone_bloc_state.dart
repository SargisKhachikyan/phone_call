class PhoneFieldState {
  final List<String> digits;
   PhoneFieldState(this.digits);

  String get phoneNumber => digits.join();
}
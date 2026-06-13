class PhoneState {
  final String digits;
  final String? audioPath;

  const PhoneState({
    required this.digits,
    this.audioPath,
  });

  PhoneState copyWith({
    String? digits,
    String? audioPath,
  }) {
    return PhoneState(
      digits: digits ?? this.digits,
      audioPath: audioPath,
    );
  }
}
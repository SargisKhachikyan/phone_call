import 'package:flutter/material.dart';
import 'package:ios_phone_call/commons/widgets/custom_app_bar.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/models/tab_enum.dart';

class PhoneCallsScreen extends StatefulWidget {
  const PhoneCallsScreen({super.key});

  @override
  State<PhoneCallsScreen> createState() => _PhoneCallsScreenState();
}

class _PhoneCallsScreenState extends State<PhoneCallsScreen> {
  final mainColor = const Color.fromARGB(255, 29, 29, 29);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const CustomAppBar(tab: BottomNavTabEnum.calls),
    );
  }
}

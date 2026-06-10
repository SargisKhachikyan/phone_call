import 'package:flutter/material.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/calling_random.dart';

class CallingScreen extends StatefulWidget {
  final String phoneNumber;

  const CallingScreen({super.key, required this.phoneNumber});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  final CallingRandom _callService = CallingRandom();

  @override
  void initState() {
    super.initState();
    _callService.callingUnder20();
  }

  @override
  void dispose() {
    _callService.clean();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    const Icon(Icons.phone_in_talk,
                        size: 100, color: Colors.green),
                    const SizedBox(height: 20),
                    const Text('Calling',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 12),
                    Text(
                      widget.phoneNumber,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: IconButton(
                  onPressed: () async {
                    await _callService.callBreak();
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.call_end, size: 50, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

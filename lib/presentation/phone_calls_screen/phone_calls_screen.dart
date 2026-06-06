import 'package:flutter/material.dart';

class PhoneCallsScreen extends StatefulWidget {
  const PhoneCallsScreen({super.key});

  @override
  State<PhoneCallsScreen> createState() => _PhoneCallsScreenState();
}

class _PhoneCallsScreenState extends State<PhoneCallsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Calls'),
    );
  }
}

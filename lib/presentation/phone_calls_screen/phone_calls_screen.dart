import 'package:flutter/material.dart';
import 'package:ios_phone_call/presentation/phone_calls_screen/models/phone_callers_list.dart';
import 'package:ios_phone_call/presentation/phone_calls_screen/widgets/single_call_card.dart';

class PhoneCallsScreen extends StatefulWidget {
  const PhoneCallsScreen({super.key});

  @override
  State<PhoneCallsScreen> createState() => _PhoneCallsScreenState();
}

class _PhoneCallsScreenState extends State<PhoneCallsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return SingleCallCard(call: calls[index]);
      },
    );
  }
}

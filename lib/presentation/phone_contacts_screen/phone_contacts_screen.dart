import 'package:flutter/material.dart';

class PhoneContactsScreen extends StatefulWidget {
  const PhoneContactsScreen({super.key});

  @override
  State<PhoneContactsScreen> createState() => _PhoneContactsScreenState();
}

class _PhoneContactsScreenState extends State<PhoneContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Contacts'),
    );
  }
}

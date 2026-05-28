import 'package:flutter/material.dart';

class ContactsAppBar extends StatelessWidget {
  final String title;
  const ContactsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
      ],
    );
  }
}

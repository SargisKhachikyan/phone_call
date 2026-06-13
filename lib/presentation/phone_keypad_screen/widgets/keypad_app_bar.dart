import 'package:flutter/material.dart';

class KeypadAppBar extends StatelessWidget {
  final String title;
  const KeypadAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

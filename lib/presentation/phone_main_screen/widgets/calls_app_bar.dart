import 'package:flutter/material.dart';

class CallsAppBar extends StatelessWidget {
  final String title;
  const CallsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

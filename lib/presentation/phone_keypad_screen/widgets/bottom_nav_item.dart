import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool isActive;
  final Function() onTap;
  const BottomNavItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.grey.withAlpha(20),
                shape: BoxShape.circle,
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 4,
            children: [
              Icon(
                iconData,
                color: isActive ? Colors.blueAccent : Colors.white,
                size: 24,
              ),
              Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.blueAccent : Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

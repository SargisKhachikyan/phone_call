import 'package:flutter/material.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/models/tab_enum.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/bottom_nav_item.dart';

class BottomNavnBar extends StatelessWidget {
  final ValueNotifier<BottomNavTabEnum> tabNotifier;
  const BottomNavnBar({super.key, required this.tabNotifier});

  @override
  Widget build(BuildContext context) {
    final tabs = BottomNavTabEnum.values.toList();
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(20),
            borderRadius: BorderRadius.circular(30),
            border: BoxBorder.all(color: Colors.white, width: 0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (final tab in tabs)
                  Expanded(
                    child: BottomNavItem(
                      iconData: tab.iconData,
                      title: tab.name,
                      isActive: tab == tabNotifier.value,
                      onTap: () {
                        tabNotifier.value = tab;
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

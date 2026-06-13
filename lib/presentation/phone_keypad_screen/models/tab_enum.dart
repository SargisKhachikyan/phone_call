import 'package:flutter/cupertino.dart';

enum BottomNavTabEnum {
  calls(iconData: CupertinoIcons.clock, name: 'Calls', appBarTitle: 'Calls'),
  contacts(iconData: CupertinoIcons.person_2, name: 'Contacts', appBarTitle: 'Lists'),
  keypad(iconData: CupertinoIcons.circle_grid_3x3_fill, name: 'Keypad', appBarTitle: 'Keypad');

  final String name;
  final IconData iconData;
  final String? appBarTitle;
  const BottomNavTabEnum({
    required this.name,
    required this.iconData,
    required this.appBarTitle,
  });
}

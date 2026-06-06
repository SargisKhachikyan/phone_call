import 'package:ios_phone_call/commons/widgets/custom_app_bar.dart';
import 'package:ios_phone_call/presentation/phone_calls_screen/phone_calls_screen.dart';
import 'package:ios_phone_call/presentation/phone_contacts_screen/phone_contacts_screen.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/models/tab_enum.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/phone_keypad_screen.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class PhoneMainScreen extends StatefulWidget {
  const PhoneMainScreen({super.key});

  @override
  State<PhoneMainScreen> createState() => _PhoneMainScreenState();
}

class _PhoneMainScreenState extends State<PhoneMainScreen> {
  late final ValueNotifier<BottomNavTabEnum> _tabNotifier;

  @override
  void initState() {
    super.initState();
    _tabNotifier = ValueNotifier(BottomNavTabEnum.keypad);
  }

  @override
  Widget build(BuildContext context) {
    final mainColor = const Color.fromARGB(255, 29, 29, 29);
    return ValueListenableBuilder<BottomNavTabEnum>(
      valueListenable: _tabNotifier,
      builder: (context, tab, child) {
        return Scaffold(
          backgroundColor: mainColor,
          appBar: CustomAppBar(tab: tab),
          body: switchpages(tab),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: BottomNavnBar(
                tabNotifier: _tabNotifier,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget switchpages(BottomNavTabEnum tab) {
    switch (tab) {
      case BottomNavTabEnum.calls:
        return PhoneCallsScreen();
      case BottomNavTabEnum.contacts:
        return PhoneContactsScreen();
      case BottomNavTabEnum.keypad:
        return PhoneKeypadScreen();
    }
  }
}

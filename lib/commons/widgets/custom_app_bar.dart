import 'package:flutter/material.dart';
import 'package:ios_phone_call/presentation/phone_main_screen/models/tab_enum.dart';
import 'package:ios_phone_call/presentation/phone_main_screen/widgets/calls_app_bar.dart';
import 'package:ios_phone_call/presentation/phone_main_screen/widgets/contacts_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BottomNavTabEnum? tab;
  const CustomAppBar({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 56,
        child: Builder(
          builder: (context) {
            switch (tab) {
              case BottomNavTabEnum.calls:
                return CallsAppBar(
                  title: BottomNavTabEnum.calls.appBarTitle!,
                );
              case BottomNavTabEnum.contacts:
                return ContactsAppBar(
                    title: BottomNavTabEnum.contacts.appBarTitle!);
              case BottomNavTabEnum.keypad:
                return const SizedBox();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

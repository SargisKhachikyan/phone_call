import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_phone_call/commons/widgets/custom_app_bar.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/constants/digit_lists.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/models/tab_enum.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/bottom_navigation_bar.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/numbers_buttons.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/numbers_field.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/phone_call_button.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc_events.dart';

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
    _tabNotifier = ValueNotifier<BottomNavTabEnum>(BottomNavTabEnum.calls);
    _tabNotifier.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BottomNavTabEnum>(
      valueListenable: _tabNotifier,
      builder: (context, tab, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 29, 29, 29),
          appBar: CustomAppBar(tab: tab),
          body: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const NumbersField(),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      crossAxisCount: 3,
                      children: [
                        for (final dig in digits)
                          InkWell(
                              highlightColor: Colors.blue,
                              onTap: () {
                                context
                                    .read<PhoneBloc>()
                                    .add(AddPhoneField(dig));
                              },
                              child: NumbersButtons(digit: dig))
                      ],
                    ),
                  ),
                  const PhoneCallButton(),
                ],
              ),
            );
          }),
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
}

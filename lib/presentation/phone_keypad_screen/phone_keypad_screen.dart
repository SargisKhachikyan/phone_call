import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_phone_call/Audio/one_tap_audio.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/constants/digit_lists.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/numbers_buttons.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/numbers_field.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/phone_call_button.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc_events.dart';

class PhoneKeypadScreen extends StatefulWidget {
  const PhoneKeypadScreen({super.key});

  @override
  State<PhoneKeypadScreen> createState() => _PhoneKeypadScreenState();
}

class _PhoneKeypadScreenState extends State<PhoneKeypadScreen> {
  @override
  Widget build(BuildContext context) {
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
                      OneTapAudio().playAudio();
                      context.read<PhoneBloc>().add(AddPhoneField(dig));
                    },
                    child: NumbersButtons(digit: dig),
                  )
              ],
            ),
          ),
          const PhoneCallButton(),
        ],
      ),
    );
  }
}

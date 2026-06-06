import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_phone_call/presentation/phone_keypad_screen/widgets/calling_screen.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc_events.dart';

class PhoneCallButton extends StatefulWidget {
  const PhoneCallButton({super.key});

  @override
  State<PhoneCallButton> createState() => _PhoneCallButtonState();
}

class _PhoneCallButtonState extends State<PhoneCallButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          final phoneNumber = context.read<PhoneBloc>().state.digits;
          if (phoneNumber.isEmpty) return;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallingScreen(phoneNumber: phoneNumber),
            ),
          );
          context.read<PhoneBloc>().add(ClearPhoneField());
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.phone,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}

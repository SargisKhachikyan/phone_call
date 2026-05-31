import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc_state.dart';

class NumbersField extends StatefulWidget {
  const NumbersField({super.key});

  @override
  State<NumbersField> createState() => _NumbersFieldState();
}

class _NumbersFieldState extends State<NumbersField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 80,
          child: BlocBuilder<PhoneBloc, PhoneFieldState>(
            builder: (context, state) {
              return Text(
                state.phoneNumber,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

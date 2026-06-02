import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc_events.dart';
import 'package:ios_phone_call/presentation/state/phone_bloc_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneFieldState> {
  PhoneBloc() : super(PhoneFieldState('')) {
    on<AddPhoneField>((event, emit) =>
        emit(PhoneFieldState([state.digits, event.digit].join())));

    on<ClearPhoneField>((event, emit) => emit(PhoneFieldState('')));
  }
}

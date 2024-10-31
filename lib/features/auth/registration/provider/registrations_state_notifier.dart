import 'package:coin_pay/features/auth/registration/provider/registration_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationStateNotifier extends StateNotifier<RegistrationState> {
  RegistrationStateNotifier() : super(const RegistrationState());

  void onNumberChanged(String number) {
    state = state.copyWith(number: number);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }
}

final selectedCountryProvider =
    StateNotifierProvider<RegistrationStateNotifier, RegistrationState>(
        (ref) => RegistrationStateNotifier());

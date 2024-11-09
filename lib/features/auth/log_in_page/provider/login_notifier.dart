import 'package:coin_pay/features/auth/log_in_page/provider/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState());

  void onCountryCodeChanged(Map<String, String> countryCode) {
    state = state.copyWith(selectedCountry: countryCode);
  }

  void onPhoneNumberEntered(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void onPasswordEntered(String password) {
    state = state.copyWith(password: password);
  }
}

final loginState = StateNotifierProvider<LoginStateNotifier, LoginState>(
    (ref) => LoginStateNotifier());

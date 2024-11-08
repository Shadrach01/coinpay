import 'package:coin_pay/features/auth/registration/provider/registration_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationStateNotifier extends StateNotifier<RegistrationState> {
  RegistrationStateNotifier() : super(const RegistrationState());

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPhoneChanged(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void onCountryCodeChanged(Map<String, String> country) {
    state = state.copyWith(selectedCountry: country);
  }

  void onPasscodeChanged(String passcodeDigit) {
    state = state.copyWith(passcode: passcodeDigit);
  }

  void onHomeAddressChanged({
    String? addressLine,
    String? city,
    String? postCode,
  }) {
    final updatedHomeAddress = state.homeAddress.copyWith(
      addressLine: addressLine,
      city: city,
      postCode: postCode,
    );
    state = state.copyWith(homeAddress: updatedHomeAddress);
  }

  void onPersonalInfoChanged({
    String? fullName,
    String? userName,
    String? dob,
  }) {
    final updatedPersonInfo = state.personalInfo.copyWith(
      fullName: fullName,
      userName: userName,
      dob: dob,
    );
    state = state.copyWith(personalInfo: updatedPersonInfo);
  }

  void onCountryOfResidenceChanged(Map<String, String> countryOfResidence) {
    state = state.copyWith(countryOfResidence: countryOfResidence);
  }
}

final registrationState =
    StateNotifierProvider<RegistrationStateNotifier, RegistrationState>(
        (ref) => RegistrationStateNotifier());

import 'package:coin_pay/core/model/user_details.dart';

class RegistrationState {
  final String password;
  final String email;
  final String phoneNumber;
  final String passcode;
  final HomeAddress homeAddress;
  final PersonalInfo personalInfo;
  final Map<String, String>? countryOfResidence;
  final Map<String, String>? selectedCountry;

  const RegistrationState({
    this.password = '',
    this.email = '',
    this.homeAddress = const HomeAddress(
      addressLine: '',
      city: '',
      postCode: '',
    ),
    this.phoneNumber = '',
    this.passcode = '',
    this.countryOfResidence,
    this.selectedCountry,
    this.personalInfo = const PersonalInfo(
      fullName: '',
      userName: '',
      dob: '',
    ),
  });

  RegistrationState copyWith({
    String? password,
    String? email,
    HomeAddress? homeAddress,
    PersonalInfo? personalInfo,
    String? phoneNumber,
    String? passcode,
    Map<String, String>? countryOfResidence,
    Map<String, String>? selectedCountry,
  }) {
    return RegistrationState(
      password: password ?? this.password,
      email: email ?? this.email,
      homeAddress: homeAddress ?? this.homeAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      personalInfo: personalInfo ?? this.personalInfo,
      countryOfResidence: countryOfResidence ?? this.countryOfResidence,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }

  // Convert toUserDetails
  UserDetails toUserDetails() {
    return UserDetails(
      email: email,
      phoneNumber: phoneNumber,
      countryOfResidence: countryOfResidence,
      personalInfo: personalInfo,
      password: password,
      passcode: passcode,
      selectedCountry: selectedCountry!,
      homeAddress: homeAddress,
    );
  }
}

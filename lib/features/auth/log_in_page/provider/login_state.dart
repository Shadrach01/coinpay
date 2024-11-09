class LoginState {
  final Map<String, String>? selectedCountry;
  final String phoneNumber;
  final String password;

  const LoginState({
    this.phoneNumber = '',
    this.selectedCountry,
    this.password = '',
  });

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    Map<String, String>? selectedCountry,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      password: password ?? this.password,
    );
  }
}

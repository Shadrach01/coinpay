class RegistrationState {
  final String number;
  final String password;

  const RegistrationState({
    this.number = '',
    this.password = '',
  });

  RegistrationState copyWith({
    String? number,
    String? password,
  }) {
    return RegistrationState(
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }
}

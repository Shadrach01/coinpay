class UserDetails {
  final String email;
  final String phoneNumber;
  final Map<String, String> selectedCountry;
  final Map<String, String>? countryOfResidence;
  final String password;
  final String passcode;
  final HomeAddress homeAddress;
  final PersonalInfo personalInfo;

  const UserDetails({
    required this.email,
    required this.phoneNumber,
    required this.selectedCountry,
    required this.countryOfResidence,
    required this.password,
    required this.passcode,
    required this.homeAddress,
    required this.personalInfo,
  });
}

// The home address class

class HomeAddress {
  final String addressLine;
  final String city;
  final String postCode;

  const HomeAddress({
    required this.addressLine,
    required this.city,
    required this.postCode,
  });

  // Define the copyWith method
  HomeAddress copyWith({
    String? addressLine,
    String? city,
    String? postCode,
  }) {
    return HomeAddress(
      addressLine: addressLine ?? this.addressLine,
      city: city ?? this.city,
      postCode: postCode ?? this.postCode,
    );
  }
}

class PersonalInfo {
  final String fullName;
  final String userName;
  final String dob;

  const PersonalInfo({
    required this.fullName,
    required this.userName,
    required this.dob,
  });

  PersonalInfo copyWith({
    String? fullName,
    String? userName,
    String? dob,
  }) {
    return PersonalInfo(
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      dob: dob ?? this.dob,
    );
  }
}

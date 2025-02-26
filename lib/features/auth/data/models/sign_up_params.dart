class SignUpParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String city;

  SignUpParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phoneNumber,
      "city": city,
    };
  }

}
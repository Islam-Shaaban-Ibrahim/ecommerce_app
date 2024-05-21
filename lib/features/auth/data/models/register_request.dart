class RegisterRequest {
  final String email;
  final String name;
  final String phone;
  final String password;

  RegisterRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": phone
    };
  }
}

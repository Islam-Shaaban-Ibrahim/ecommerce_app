class User {
  final String? name;
  final String? email;
  final String? role;

  const User({this.name, this.email, this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
      };
}

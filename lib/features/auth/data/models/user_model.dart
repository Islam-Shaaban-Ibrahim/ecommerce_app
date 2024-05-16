import 'package:ecommerce_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  final String? role;

  const UserModel({super.email, super.name, this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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

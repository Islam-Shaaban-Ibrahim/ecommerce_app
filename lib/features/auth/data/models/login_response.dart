import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

class LoginResponse {
  final String? message;
  final UserModel? user;
  final String? token;

  const LoginResponse({this.message, this.user, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };
}

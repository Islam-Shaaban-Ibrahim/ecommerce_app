import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest requestBody);
  Future<RegisterResponse> register(RegisterRequest requestBody);
}

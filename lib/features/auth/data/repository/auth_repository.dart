import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response/register_response.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  Future<LoginResponse> login(LoginRequest requestBody) async {
    return await remoteDataSource.login(requestBody);
  }

  Future<RegisterResponse> register(RegisterRequest requestBody) async {
    return await remoteDataSource.register(requestBody);
  }
}

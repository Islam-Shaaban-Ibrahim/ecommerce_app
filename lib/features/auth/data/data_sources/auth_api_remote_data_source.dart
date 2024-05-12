import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_constants.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response/register_response.dart';

class AuthAPIDataSource implements AuthRemoteDataSource {
  final _dio = Dio(BaseOptions(
    baseUrl: APIConstants.baseUrl,
    receiveDataWhenStatusError: true,
  ));
  @override
  Future<LoginResponse> login(LoginRequest requestBody) async {
    final response = await _dio.post(
      APIConstants.loginEndPoint,
      data: requestBody.toJson(),
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest requestBody) async {
    final response = await _dio.post(
      APIConstants.registerEndPoint,
      data: requestBody.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }
}

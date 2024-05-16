import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthAPIRemoteDataSource implements AuthRemoteDataSource {
  final _dio = Dio(BaseOptions(
    baseUrl: APIConstants.baseUrl,
    receiveDataWhenStatusError: true,
  ));
  @override
  Future<LoginResponse> login(LoginRequest requestBody) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndPoint,
        data: requestBody.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      var errorMessage = 'Failed To Login';
      if (exception is DioException) {
        final responseMessage = exception.response?.data['message'];
        if (responseMessage != null) {
          errorMessage = responseMessage;
        }
      }
      throw RemoteException(errorMessage);
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest requestBody) async {
    try {
      final response = await _dio.post(
        APIConstants.registerEndPoint,
        data: requestBody.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      var errorMessage = 'Failed To Register';
      if (exception is DioException) {
        final responseMessage = exception.response?.data['message'];
        if (responseMessage != null) {
          errorMessage = responseMessage;
        }
      }
      throw RemoteException(errorMessage);
    }
  }
}

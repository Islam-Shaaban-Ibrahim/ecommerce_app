import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final sharedPref = await SharedPreferences.getInstance();
          final token = sharedPref.get(CacheConstants.tokenKey);
          options.headers[APIConstants.tokenKey] = token;
          return handler.next(options);
        },
      ),
    );
    return dio;
  }

  @preResolve
  Future<SharedPreferences> getPrefs() => SharedPreferences.getInstance();
}

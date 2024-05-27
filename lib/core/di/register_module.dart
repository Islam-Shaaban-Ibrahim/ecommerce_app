import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ));

  @preResolve
  Future<SharedPreferences> getPrefs() => SharedPreferences.getInstance();
}

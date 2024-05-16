import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      final pref = await SharedPreferences.getInstance();
      return pref.getString(CacheConstants.tokenKey)!;
    } catch (error) {
      throw LocalException('Failed to get token');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      final pref = await SharedPreferences.getInstance();
      pref.setString(CacheConstants.tokenKey, token);
    } catch (error) {
      throw LocalException('Failed to save token');
    }
  }
}

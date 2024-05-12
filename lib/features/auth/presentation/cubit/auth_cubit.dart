import 'package:ecommerce_app/features/auth/data/data_sources/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authRepository = AuthRepository(remoteDataSource: AuthAPIDataSource());
  Future<void> login(LoginRequest requestBody) async {
    emit(LoginLoading());
    try {
      await authRepository.login(requestBody);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginError());
    }
  }

  Future<void> register(RegisterRequest requestBody) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(requestBody);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterError());
    }
  }
}

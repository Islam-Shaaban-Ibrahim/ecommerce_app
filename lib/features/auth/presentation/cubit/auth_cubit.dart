import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._login, this._register) : super(AuthInitial());
  final Login _login;
  final Register _register;

  Future<void> login(LoginRequest requestBody) async {
    emit(LoginLoading());

    final result = await _login(requestBody);
    result.fold((failure) => emit(LoginError(failure.errorMessage)),
        (user) => emit(LoginSuccess()));
  }

  Future<void> register(RegisterRequest requestBody) async {
    emit(RegisterLoading());

    final result = await _register(requestBody);
    result.fold((failure) => emit(RegisterError(failure.errorMessage)),
        (user) => emit(RegisterSuccess()));
  }
}

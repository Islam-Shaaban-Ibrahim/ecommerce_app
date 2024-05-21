import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Login {
  final AuthRepository repository;
  const Login(this.repository);
  Future<Either<Failure, User>> call(LoginRequest requestBody) {
    return repository.login(requestBody);
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Register {
  final AuthRepository repository;
  const Register(this.repository);
  Future<Either<Failure, User>> call(RegisterRequest requestBody) {
    return repository.register(requestBody);
  }
}

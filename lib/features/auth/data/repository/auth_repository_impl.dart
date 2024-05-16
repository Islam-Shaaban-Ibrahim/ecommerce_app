import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource, this.remoteDataSource);

  Future<Either<Failure, User>> login(LoginRequest requestBody) async {
    try {
      final response = await remoteDataSource.login(requestBody);
      if (response.token != null && response.user != null) {
        await localDataSource.saveToken(response.token!);
        return Right(response.user!);
      } else {
        return const Left(Failure());
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.errorMessage));
    }
  }

  Future<Either<Failure, User>> register(RegisterRequest requestBody) async {
    try {
      final response = await remoteDataSource.register(requestBody);
      if (response.token != null && response.user != null) {
        await localDataSource.saveToken(response.token!);
        return Right(response.user!);
      } else {
        return const Left(Failure());
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.errorMessage));
    }
  }
}

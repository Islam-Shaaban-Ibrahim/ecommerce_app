import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/home/domain/entities/category.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetCategories {
  final HomeRepository _repository;

  GetCategories(this._repository);

  Future<Either<Failure, List<Category>>> call() {
    return _repository.getCategories();
  }
}

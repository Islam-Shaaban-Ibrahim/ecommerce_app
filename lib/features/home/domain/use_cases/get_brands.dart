import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/home/domain/entities/brand.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetBrands {
  final HomeRepository _repository;

  GetBrands(this._repository);

  Future<Either<Failure, List<Brand>>> call() {
    return _repository.getBrands();
  }
}

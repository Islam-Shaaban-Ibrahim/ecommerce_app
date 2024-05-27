import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetProducts {
  final ProductsRepository _repository;
  GetProducts(this._repository);
  Future<Either<Failure, List<Product>>> call() {
    return _repository.getProducts();
  }
}

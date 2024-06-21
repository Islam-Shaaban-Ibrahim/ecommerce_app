import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddToCart {
  final CartRepository _repository;
  AddToCart(this._repository);
  Future<Either<Failure, void>> call(String productId) async {
    return await _repository.addToCart(productId);
  }
}

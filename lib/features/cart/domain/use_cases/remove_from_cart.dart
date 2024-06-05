import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoveFromCart {
  final CartRepository _repository;
  RemoveFromCart(this._repository);
  Future<Either<Failure, Cart>> call(String productId) async {
    return await _repository.removeFromCart(productId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateCart {
  final CartRepository _repository;
  UpdateCart(this._repository);

  Future<Either<Failure, Cart>> call(String productId, int count) async {
    return await _repository.updateCart(productId, count);
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, void>> addToCart(String productId);
  Future<Either<Failure, Cart>> updateCart(String productId, int count);
  Future<Either<Failure, Cart>> removeFromCart(String productId);
}

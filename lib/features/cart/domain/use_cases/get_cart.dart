import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetCart {
  final CartRepository _cartRepository;
  GetCart(this._cartRepository);
  Future<Either<Failure, Cart>> call() async {
    return await _cartRepository.getCart();
  }
}

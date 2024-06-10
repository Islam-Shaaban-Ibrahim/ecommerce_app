import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddToWishlist {
  final WishlistRepository _repository;
  AddToWishlist(this._repository);
  Future<Either<Failure, void>> call(String productId) {
    return _repository.addToWishlist(productId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoveFromWishlist {
  final WishlistRepository _repository;
  RemoveFromWishlist(this._repository);
  Future<Either<Failure, void>> call(String productId) async {
    return await _repository.removeFromWishlist(productId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<WishlistItemData>>> getWishlist();
  Future<Either<Failure, void>> removeFromWishlist(String productId);
  Future<Either<Failure, void>> addToWishlist(String productId);
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';
import 'package:ecommerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetWishlist {
  final WishlistRepository _repository;
  GetWishlist(this._repository);
  Future<Either<Failure, List<WishlistItemData>>> call() async {
    return await _repository.getWishlist();
  }
}

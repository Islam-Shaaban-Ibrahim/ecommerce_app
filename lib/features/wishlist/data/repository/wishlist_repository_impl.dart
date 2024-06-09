import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/wishlist/data/data%20_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';
import 'package:ecommerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource _dataSource;
  WishlistRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, List<WishlistItemData>>> getWishlist() async {
    try {
      final response = await _dataSource.getWishlist();
      return Right(response.data);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addToWishlist(String productId) {
    // TODO: implement addToWishlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<WishlistItemData>>> removeFromWishlist(
      String productId) {
    // TODO: implement removeFromWishlist
    throw UnimplementedError();
  }
}

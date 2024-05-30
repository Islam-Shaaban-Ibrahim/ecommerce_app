import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/data/data%20source/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CartRepository)
class CartRepositoryImp implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;
  CartRepositoryImp(this._remoteDataSource);
  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final response = await _remoteDataSource.getCart();
      return Right(response.data);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String productId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateCart(String productId, int count) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/data/data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _remoteDataSource;
  ProductsRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await _remoteDataSource.getProducts();
      return Right(products.data);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.errorMessage));
    }
  }
}

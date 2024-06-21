import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/products/data/data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/models/products_response/products_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductsRemoteDataSource)
class ProductsApiRemoteDataSource implements ProductsRemoteDataSource {
  final Dio _dio;
  ProductsApiRemoteDataSource(this._dio);
  @override
  Future<ProductsResponse> getProducts() async {
    try {
      final response = await _dio.get(APIConstants.productsEndPoint);
      return ProductsResponse.fromJson(response.data);
    } catch (e) {
      throw RemoteException('Failed To GET Products');
    }
  }
}

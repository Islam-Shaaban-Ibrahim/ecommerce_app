import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app/features/home/data/models/brands_response/brands_response.dart';
import 'package:ecommerce_app/features/home/data/models/categories_response/categories_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;
  const HomeApiRemoteDataSource(this._dio);
  @override
  Future<BrandsResponse> getBrands() async {
    try {
      final response = await _dio.get(APIConstants.brandsEndPoint);
      return BrandsResponse.fromJson(response.data);
    } catch (_) {
      throw RemoteException('Failed To Get Brands');
    }
  }

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data);
    } catch (_) {
      throw RemoteException('Failed To Get Categories');
    }
  }
}

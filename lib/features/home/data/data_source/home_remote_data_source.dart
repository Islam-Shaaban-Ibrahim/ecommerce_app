import 'package:ecommerce_app/features/home/data/models/brands_response/brands_response.dart';
import 'package:ecommerce_app/features/home/data/models/categories_response/categories_response.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesResponse> getCategories();
  Future<BrandsResponse> getBrands();
}

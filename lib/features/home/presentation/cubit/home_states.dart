import 'package:ecommerce_app/features/home/domain/entities/brand.dart';
import 'package:ecommerce_app/features/home/domain/entities/category.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  final List<Category> categories;
  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends HomeState {
  final String error;
  GetCategoriesError(this.error);
}

class GetBrandsLoading extends HomeState {}

class GetBrandsSuccess extends HomeState {
  final List<Brand> brands;
  GetBrandsSuccess(this.brands);
}

class GetBrandsError extends HomeState {
  final String error;
  GetBrandsError(this.error);
}

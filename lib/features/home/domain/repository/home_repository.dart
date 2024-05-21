import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/home/domain/entities/brand.dart';
import 'package:ecommerce_app/features/home/domain/entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Brand>>> getBrands();
}

import 'package:ecommerce_app/features/home/domain/entities/brand.dart';
import 'package:ecommerce_app/features/home/domain/use_cases/get_brands.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/brands/brands_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class BrandsCubit extends Cubit<BrandsState> {
  List<Brand> brands = [];
  final GetBrands _getBrands;
  BrandsCubit(this._getBrands) : super(BrandsInitial());
  Future<void> getBrands() async {
    emit(GetBrandsLoading());
    final result = await _getBrands();

    result.fold(
      (failure) => emit(GetBrandsError(failure.errorMessage)),
      (list) {
        brands = list;
        emit(GetBrandsSuccess());
      },
    );
  }
}

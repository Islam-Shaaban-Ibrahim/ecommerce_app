import 'package:ecommerce_app/features/home/domain/use_cases/get_brands.dart';
import 'package:ecommerce_app/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCategories _getCategories;
  final GetBrands _getBrands;

  HomeCubit(this._getBrands, this._getCategories) : super(HomeInitial());

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(GetCategoriesError(failure.errorMessage)),
      (list) => emit(GetCategoriesSuccess(list)),
    );
  }

  Future<void> getBrands() async {
    emit(GetBrandsLoading());
    final result = await _getBrands();
    result.fold(
      (failure) => emit(GetBrandsError(failure.errorMessage)),
      (list) => emit(GetBrandsSuccess(list)),
    );
  }
}

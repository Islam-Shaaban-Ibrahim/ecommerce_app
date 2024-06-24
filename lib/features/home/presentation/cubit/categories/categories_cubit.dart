import 'package:ecommerce_app/features/home/domain/entities/category.dart';
import 'package:ecommerce_app/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/categories/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategories _getCategories;

  List<Category> categories = [];
  CategoriesCubit(this._getCategories) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());

    final result = await _getCategories();
    result.fold(
      (failure) => emit(GetCategoriesError(failure.errorMessage)),
      (list) {
        categories = list;
        emit(GetCategoriesSuccess());
      },
    );
  }
}

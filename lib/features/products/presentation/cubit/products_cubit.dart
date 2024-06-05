import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/use_cases/get_products.dart';
import 'package:ecommerce_app/features/products/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProducts) : super(ProductsInitial());
  final GetProducts _getProducts;
  List<Product> products = [];
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await _getProducts();
    result.fold(
        (failure) => emit(
              ProductsError(failure.errorMessage),
            ), (productsList) {
      products = productsList;
      emit(
        ProductsSuccess(),
      );
    });
  }
}

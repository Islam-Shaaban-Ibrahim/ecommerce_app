abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {}

class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}

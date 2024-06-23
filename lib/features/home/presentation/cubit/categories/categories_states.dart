abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class GetCategoriesLoading extends CategoriesState {}

class GetCategoriesSuccess extends CategoriesState {}

class GetCategoriesError extends CategoriesState {
  final String error;
  GetCategoriesError(this.error);
}

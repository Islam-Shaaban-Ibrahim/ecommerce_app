abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {}

class GetCategoriesError extends HomeState {
  final String error;
  GetCategoriesError(this.error);
}

class GetBrandsLoading extends HomeState {}

class GetBrandsSuccess extends HomeState {}

class GetBrandsError extends HomeState {
  final String error;
  GetBrandsError(this.error);
}

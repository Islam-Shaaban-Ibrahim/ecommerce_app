abstract class BrandsState {}

class BrandsInitial extends BrandsState {}

class GetBrandsLoading extends BrandsState {}

class GetBrandsSuccess extends BrandsState {}

class GetBrandsError extends BrandsState {
  final String error;
  GetBrandsError(this.error);
}

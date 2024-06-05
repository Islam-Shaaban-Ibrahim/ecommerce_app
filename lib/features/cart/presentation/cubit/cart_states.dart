abstract class CartState {}

class CartInitial extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

class GetCartLoading extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}

class UpdateCartLoading extends CartState {}

class UpdateCartSuccess extends CartState {}

class UpdateCartError extends CartState {
  final String message;
  UpdateCartError(this.message);
}

class RemoveFromCartLoading extends CartState {}

class RemoveFromCartSuccess extends CartState {}

class RemoveFromCartError extends CartState {
  final String message;
  RemoveFromCartError(this.message);
}

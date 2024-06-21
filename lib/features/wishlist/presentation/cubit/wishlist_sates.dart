abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class GetWishlistLoading extends WishlistState {}

class GetWishlistError extends WishlistState {
  final String message;
  GetWishlistError(this.message);
}

class GetWishlistSuccess extends WishlistState {}

class AddToWishlistLoading extends WishlistState {}

class AddToWishlistError extends WishlistState {
  final String message;
  AddToWishlistError(this.message);
}

class AddToWishlistSuccess extends WishlistState {}

class RemoveFromWishlistLoading extends WishlistState {}

class RemoveFromWishlistError extends WishlistState {
  final String message;
  RemoveFromWishlistError(this.message);
}

class RemoveFromWishlistSuccess extends WishlistState {}

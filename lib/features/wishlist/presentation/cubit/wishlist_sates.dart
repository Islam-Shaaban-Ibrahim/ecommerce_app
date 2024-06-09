abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class GetWishlistLoading extends WishlistState {}

class GetWishlistError extends WishlistState {
  final String message;
  GetWishlistError(this.message);
}

class GetWishlistSuccess extends WishlistState {}

import 'package:ecommerce_app/features/wishlist/data/models/wishlist_response/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistResponse> getWishlist();
  Future<void> removeFromWishlist(String productId);
  Future<void> addToWishlist(String productId);
}

import 'package:ecommerce_app/features/cart/data/models/cart_response/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> getCart();
  Future<void> addToCart(String productId);
  Future<CartResponse> removeFromCart(String productId);
  Future<CartResponse> updateCart(String productId, int count);
}

import 'package:ecommerce_app/features/cart/data/models/cart_response/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> getCart();
  Future addToCart(String productId);
  Future deleteFromCart(String productId);
  Future updateCart(String productId, int count);
}

import 'package:ecommerce_app/features/cart/domain/entities/cart_product.dart';

class CartItemData {
  final int count;
  final String id;
  final CartProduct product;
  final int price;

  const CartItemData({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });
}

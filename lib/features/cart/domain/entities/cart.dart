import 'package:ecommerce_app/features/cart/domain/entities/cart_item.dart';

class Cart {
  final List<CartItemData> products;

  final int totalCartPrice;

  const Cart({
    required this.products,
    required this.totalCartPrice,
  });
}

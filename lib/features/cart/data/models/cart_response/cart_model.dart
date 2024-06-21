import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';

import 'cart_item_model.dart';

class CartModel extends Cart {
  const CartModel({
    required super.products,
    required super.totalCartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        products: (json['products'] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCartPrice: json['totalCartPrice'] as int,
      );
}

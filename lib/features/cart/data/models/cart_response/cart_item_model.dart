import 'package:ecommerce_app/features/cart/data/models/cart_response/cart_product_model.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_item.dart';

class CartItemModel extends CartItemData {
  const CartItemModel({
    required super.count,
    required super.id,
    required super.product,
    required super.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        count: json['count'] as int,
        id: json['_id'] as String,
        product:
            CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
        price: json['price'] as int,
      );
}

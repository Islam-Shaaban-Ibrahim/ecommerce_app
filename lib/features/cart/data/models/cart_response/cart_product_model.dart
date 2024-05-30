import 'package:ecommerce_app/features/cart/domain/entities/cart_product.dart';

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.id,
    required super.title,
    required super.imageCover,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json["_id"] as String,
      title: json["title"] as String,
      imageCover: json["imageCover"] as String,
    );
  }
}

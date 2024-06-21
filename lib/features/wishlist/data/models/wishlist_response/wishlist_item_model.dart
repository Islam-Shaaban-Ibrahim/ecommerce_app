import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';

class WishlistItemModel extends WishlistItemData {
  const WishlistItemModel({
    required super.imageCover,
    required super.id,
    required super.title,
    required super.price,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      WishlistItemModel(
        id: json['_id'] as String,
        title: json['title'] as String,
        price: json['price'] as int,
        imageCover: json['imageCover'] as String,
      );
}

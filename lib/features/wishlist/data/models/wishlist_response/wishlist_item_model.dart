import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';

class WishlistItemModel extends WishlistItemData {
  final int? sold;
  final List<String>? images;

  final int? ratingsQuantity;

  final String? description;
  final int? quantity;

  final double? ratingsAverage;

  const WishlistItemModel({
    required super.imageCover,
    required super.id,
    required super.title,
    required super.price,
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.description,
    this.quantity,
    this.ratingsAverage,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      WishlistItemModel(
        sold: json['sold'] as int?,
        images: json['images'] as List<String>?,
        ratingsQuantity: json['ratingsQuantity'] as int?,
        id: json['_id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int,
        imageCover: json['imageCover'] as String,
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      );
}

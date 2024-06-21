import 'wishlist_item_model.dart';

class WishlistResponse {
  final List<WishlistItemModel> data;

  const WishlistResponse({required this.data});

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => WishlistItemModel.fromJson(e))
          .toList(),
    );
  }
}

import 'wishlist_item_model.dart';

class WishlistResponse {
  final String? status;
  final int? count;
  final List<WishlistItemModel> data;

  const WishlistResponse({this.status, this.count, required this.data});

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      status: json['status'] as String?,
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>)
          .map((e) => WishlistItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

import 'cart_model.dart';

class CartResponse {
  final String? status;
  final int? numOfCartItems;
  final CartModel data;

  const CartResponse({this.status, this.numOfCartItems, required this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        status: json['status'] as String?,
        numOfCartItems: json['numOfCartItems'] as int?,
        data: CartModel.fromJson(json['data'] as Map<String, dynamic>),
      );
}

import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class GetCartSuccess extends CartState {
  final Cart cart;
  GetCartSuccess(this.cart);
}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

class GetCartLoading extends CartState {}

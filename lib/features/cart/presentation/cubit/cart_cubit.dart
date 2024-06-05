import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/remove_from_cart.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/update_cart.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCart _getCart;
  final AddToCart _addToCart;
  final UpdateCart _updateCart;
  final RemoveFromCart _removeFromCart;
  late Cart cart;
  bool isCartEmpty = false;

  CartCubit(
    this._getCart,
    this._addToCart,
    this._updateCart,
    this._removeFromCart,
  ) : super(CartInitial());
  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();

    result.fold(
      (failure) => emit(GetCartError(failure.errorMessage)),
      (cartResponse) {
        cart = cartResponse;
        if (cart.products.isEmpty) {
          isCartEmpty = true;
        }
        emit(GetCartSuccess());
      },
    );
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    final result = await _addToCart(productId);
    result.fold(
      (failure) => emit(AddToCartError(failure.errorMessage)),
      (success) => emit(AddToCartSuccess()),
    );
  }

  Future<void> updateCart(String productId, int count) async {
    emit(UpdateCartLoading());
    final result = await _updateCart(productId, count);
    result.fold(
      (failure) => emit(UpdateCartError(failure.errorMessage)),
      (cartResponse) {
        cart = cartResponse;
        emit(UpdateCartSuccess());
      },
    );
  }

  Future<void> removeFromCart(String productId) async {
    emit(RemoveFromCartLoading());
    final result = await _removeFromCart(productId);
    result.fold(
      (failure) => emit(RemoveFromCartError(failure.errorMessage)),
      (cartResponse) {
        cart = cartResponse;
        if (cart.products.isEmpty) {
          isCartEmpty = true;
        }
        emit(RemoveFromCartSuccess());
      },
    );
  }
}

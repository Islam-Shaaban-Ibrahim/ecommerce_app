import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCart _getCart;
  final AddToCart _addToCart;

  CartCubit(this._getCart, this._addToCart) : super(CartInitial());
  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();

    result.fold(
      (failure) => emit(GetCartError(failure.errorMessage)),
      (cart) => emit(GetCartSuccess(cart)),
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
}

import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final GetCart _getCart;

  CartCubit(this._getCart) : super(CartInitial());
  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();

    result.fold(
      (failure) => emit(GetCartError(failure.errorMessage)),
      (cart) => emit(GetCartSuccess(cart)),
    );
  }
}

import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';
import 'package:ecommerce_app/features/wishlist/domain/use_cases/get_wishlist.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_sates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlist _getWishlist;
  List<WishlistItemData> wishlist = [];
  WishlistCubit(this._getWishlist) : super(WishlistInitial());

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    final result = await _getWishlist();
    result.fold(
      (failure) => emit(GetWishlistError(failure.errorMessage)),
      (listResponse) {
        wishlist = listResponse;
        emit(GetWishlistSuccess());
      },
    );
  }
}

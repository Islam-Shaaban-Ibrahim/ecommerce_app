import 'package:ecommerce_app/features/wishlist/domain/entities/wishlist_item_data.dart';
import 'package:ecommerce_app/features/wishlist/domain/use_cases/add_to_wishlist.dart';
import 'package:ecommerce_app/features/wishlist/domain/use_cases/get_wishlist.dart';
import 'package:ecommerce_app/features/wishlist/domain/use_cases/remove_from_wishlist.dart';
import 'package:ecommerce_app/features/wishlist/presentation/cubit/wishlist_sates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlist _getWishlist;
  final AddToWishlist _addToWishlist;
  final RemoveFromWishlist _removeFromWishlist;
  List<WishlistItemData> wishlist = [];
  List<String> productIDs = [];
  WishlistCubit(
    this._getWishlist,
    this._addToWishlist,
    this._removeFromWishlist,
  ) : super(WishlistInitial());

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    final result = await _getWishlist();
    result.fold(
      (failure) => emit(GetWishlistError(failure.errorMessage)),
      (listResponse) {
        wishlist = listResponse;

        productIDs = wishlist.map((e) => e.id).toList();

        emit(GetWishlistSuccess());
      },
    );
  }

  Future<void> addToWishlist(String productId) async {
    emit(AddToWishlistLoading());
    final result = await _addToWishlist(productId);
    result.fold(
      (failure) => emit(AddToWishlistError(failure.errorMessage)),
      (success) {
        emit(AddToWishlistSuccess());
      },
    );
  }

  Future<void> removeFromWishlist(String productId) async {
    emit(RemoveFromWishlistLoading());
    final result = await _removeFromWishlist(productId);
    result.fold(
      (failure) => emit(RemoveFromWishlistError(failure.errorMessage)),
      (success) {
        emit(RemoveFromWishlistSuccess());
      },
    );
  }
}

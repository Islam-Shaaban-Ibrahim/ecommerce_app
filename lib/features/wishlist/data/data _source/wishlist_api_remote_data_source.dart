import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/wishlist/data/data%20_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/features/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: WishlistRemoteDataSource)
class WishlistApiRemoteDataSource implements WishlistRemoteDataSource {
  final Dio _dio;
  WishlistApiRemoteDataSource(this._dio);

  @override
  Future<WishlistResponse> getWishlist() async {
    try {
      final response = await _dio.get(APIConstants.wishlistEndPoint);
      return WishlistResponse.fromJson(response.data);
    } catch (e) {
      throw RemoteException('Failed To Get Wishlist');
    }
  }

  @override
  Future<void> addToWishlist(String productId) async {
    try {
      await _dio.post(APIConstants.wishlistEndPoint, data: {
        "productId": productId,
      });
    } catch (_) {
      throw RemoteException('Failed To Add Product');
    }
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
    try {
      await _dio.delete(
        "${APIConstants.wishlistEndPoint}/$productId",
      );
    } catch (e) {
      throw RemoteException('Failed To Remove Product');
    }
  }
}

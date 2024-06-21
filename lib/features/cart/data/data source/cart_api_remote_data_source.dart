import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/cart/data/data%20source/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_response/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;
  const CartApiRemoteDataSource(this._dio);
  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.cartEndPoint);
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      if (exception is DioException && exception.response?.statusCode == 404) {
        throw RemoteException('Cart is empty');
      }
      throw RemoteException('Failed To Get Cart');
    }
  }

  @override
  Future<void> addToCart(String productId) async {
    try {
      await _dio
          .post(APIConstants.cartEndPoint, data: {"productId": productId});
    } catch (e) {
      throw RemoteException('Failed To Add Product');
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int count) async {
    try {
      final response = await _dio.put('${APIConstants.cartEndPoint}/$productId',
          data: {"count": count});
      return CartResponse.fromJson(response.data);
    } catch (_) {
      throw RemoteException('Failed To Update Cart');
    }
  }

  @override
  Future<CartResponse> removeFromCart(String productId) async {
    try {
      final response = await _dio.delete(
        "${APIConstants.cartEndPoint}/$productId",
      );
      return CartResponse.fromJson(response.data);
    } catch (_) {
      throw RemoteException("Failed To Delete Item");
    }
  }
}

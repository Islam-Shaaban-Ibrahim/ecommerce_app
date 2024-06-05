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
      print(e);
      throw RemoteException('Failed To Add Product');
    }
  }

  @override
  Future deleteFromCart(String productId) {
    // TODO: implement deleteFromCart
    throw UnimplementedError();
  }

  @override
  Future updateCart(String productId, int count) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }
}

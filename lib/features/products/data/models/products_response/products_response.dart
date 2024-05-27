import 'product_model.dart';
import 'metadata.dart';

class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<ProductModel> data;

  const ProductsResponse({this.results, this.metadata, required this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

import 'brand_model.dart';
import 'metadata.dart';

class BrandsResponse {
  final int? results;
  final Metadata? metadata;
  final List<BrandModel> data;

  const BrandsResponse({this.results, this.metadata, required this.data});

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return BrandsResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results,
        'metadata': metadata?.toJson(),
        'data': data.map((e) => e.toJson()).toList(),
      };
}

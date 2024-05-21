import 'package:ecommerce_app/features/home/domain/entities/brand.dart';

class BrandModel extends Brand {
  final String? slug;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const BrandModel({
    required super.id,
    required super.name,
    required super.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String?,
        image: json['image'] as String,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

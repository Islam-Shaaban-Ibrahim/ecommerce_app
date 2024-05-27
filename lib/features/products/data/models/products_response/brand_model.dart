class BrandModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const BrandModel({this.id, this.name, this.slug, this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );
}

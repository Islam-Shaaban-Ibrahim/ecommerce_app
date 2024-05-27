class CategoryModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const CategoryModel({this.id, this.name, this.slug, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );
}

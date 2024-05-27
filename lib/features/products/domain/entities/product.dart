class Product {
  final int sold;
  final List<dynamic> images;
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageCover;
  final double ratingsAverage;
  final int ratingsQuantity;

  const Product({
    required this.sold,
    required this.images,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
    required this.ratingsQuantity,
  });
}

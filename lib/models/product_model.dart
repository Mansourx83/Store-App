class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'] as int,
      title: jsonData['title'] as String,
      price: _convertToDouble(jsonData['price']),
      description: jsonData['description'] as String,
      image: jsonData['image'] as String,
      category: jsonData['category'] as String,
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'] as Map<String, dynamic>)
          : null,
    );
  }

  static double _convertToDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else if (value is num) {
      return value.toDouble();
    } else {
      throw ArgumentError('Cannot convert $value to double');
    }
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: ProductModel._convertToDouble(jsonData['rate']),
      count: jsonData['count'] as int,
    );
  }
}

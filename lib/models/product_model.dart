class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'] as int,
      title: jsonData['title'] as String,
      price:
          (jsonData['price'] as num).toDouble(), // Ensure 'price' is a double
      description: jsonData['description'] as String,
      image: jsonData['image'] as String,
      rating: RatingModel.fromJson(jsonData['rating'] as Map<String, dynamic>),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(), // Ensure 'rate' is a double
      count: jsonData['count'] as int,
    );
  }
}


class Product {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'].toString(),
        title: json['title'].toString(),
        price: json['price'].toString(),
        description: json['description'].toString(),
        category: json['category'].toString(),
        image: json['image'].toString(),
        rating: Rating.fromJson(json['rating']));
  }
}

class Rating {
  final String rate;
  final String count;

  const Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toString(),
      count: json['count'].toString(),
    );
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String category;
  final String thumbnail;
  final List<String> images;
  final String brand;
  final String availabilityStatus;
  final String warrantyInformation;
  final String shippingInformation;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final List<ProductReview> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.category,
    required this.thumbnail,
    required this.images,
    required this.brand,
    required this.availabilityStatus,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      brand: json['brand'] ?? 'Unknown',
      availabilityStatus: json['availabilityStatus'] ?? 'In Stock',
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
      reviews: (json['reviews'] as List? ?? [])
          .map((e) => ProductReview.fromJson(e))
          .toList(),
    );
  }

  double get discountedPrice => price * (1 - discountPercentage / 100);

  bool get isInStock => availabilityStatus != 'Out of Stock';
}

class ProductReview {
  final int rating;
  final String comment;
  final String reviewerName;
  final String date;

  ProductReview({
    required this.rating,
    required this.comment,
    required this.reviewerName,
    required this.date,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
      date: json['date'] ?? '',
    );
  }
}

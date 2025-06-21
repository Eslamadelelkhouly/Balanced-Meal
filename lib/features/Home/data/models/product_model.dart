class ProductCategoryModel {
  final List<ProductItem> vegetables;
  final List<ProductItem> carbs;
  final List<ProductItem> meats;

  ProductCategoryModel({
    required this.vegetables,
    required this.carbs,
    required this.meats,
  });
}

class ProductItem {
  final String foodName;
  int quantity;
  int totalPrice;
  final String imageUrl;
  final int calories;

  ProductItem({
    required this.foodName,
    required this.quantity,
    required this.totalPrice,
    required this.imageUrl,
    required this.calories,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      foodName: json['food_name'] ?? '',
      quantity: json['quantity'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      calories: json['calories'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food_name': foodName,
      'quantity': quantity,
      'total_price': totalPrice,
      'image_url': imageUrl,
      'calories': calories,
    };
  }
}

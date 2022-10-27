import 'package:kt_nguyen_don_phuoc/models/rating_model.dart';

class ProductModel {
  int? id;
  double? price;
  String? description;
  String? title;
  String? category;
  String? image;
  RatingModel? rating;
  ProductModel({
    this.id,
    this.price,
    this.title,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> obj, RatingModel rating) {
    return ProductModel(
        id: obj["id"],
        price: obj['price'].toDouble(),
        title: obj['title'],
        category: obj['category'],
        description: obj['description'],
        image: obj['image'],
        rating: rating);
  }
}

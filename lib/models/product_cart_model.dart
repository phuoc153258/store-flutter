class ProductCartModel {
  int? productId;
  int? quantity;
  ProductCartModel({
    required this.productId,
    this.quantity,
  });
  factory ProductCartModel.fromJson(Map<String, dynamic> obj) {
    return ProductCartModel(
      productId: obj["productId"],
      quantity: obj['quantity'],
    );
  }
}

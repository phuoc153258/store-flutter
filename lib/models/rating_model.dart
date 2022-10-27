class RatingModel {
  double rate;
  int? count;
  RatingModel({
    required this.rate,
    this.count,
  });
  factory RatingModel.fromJson(Map<String, dynamic> obj) {
    return RatingModel(
      rate: obj["rate"].toDouble(),
      count: obj['count'],
    );
  }
}

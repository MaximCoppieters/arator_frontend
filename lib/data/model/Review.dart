import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';
import 'Product.dart';
import 'User.dart';

part 'Review.g.dart';

@JsonSerializable()
class Review implements Model {
  final String comment;
  final int rating;
  final User reviewer;

  Review(this.rating, this.comment, this.reviewer);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

class ProductReview extends Review {
  final Product product;

  ProductReview(int rating, String content, reviewer, this.product)
      : super(rating, content, reviewer);
}

class UserReview extends Review {
  final User reviewed;

  UserReview(int rating, String content, User reviewer, this.reviewed)
      : super(rating, content, reviewer);
}

import 'package:json_annotation/json_annotation.dart';

import 'Product.dart';
import 'User.dart';

part 'Review.g.dart';

@JsonSerializable(nullable: false)
class Review {
  final String content;
  final int rating;
  final User reviewer;

  Review(this.rating, this.content, this.reviewer);

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

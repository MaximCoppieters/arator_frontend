import 'Produce.dart';
import 'User.dart';

class Review {
  final String content;
  final int rating;
  final User reviewer;

  Review(this.rating, this.content, this.reviewer);
}

class ProductReview extends Review {
  final Produce produce;

  ProductReview(int rating, String content, reviewer, this.produce)
      : super(rating, content, reviewer);
}

class UserReview extends Review {
  final User reviewed;

  UserReview(int rating, String content, User reviewer, this.reviewed)
      : super(rating, content, reviewer);
}

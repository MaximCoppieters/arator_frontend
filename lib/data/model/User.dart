import 'package:arator/business/app_image.dart';
import 'package:arator/data/model/UserSettings.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';
import 'Product.dart';
import 'Review.dart';
import 'UserAddress.dart';

part 'User.g.dart';

@JsonSerializable()
class User implements Model {
  @JsonKey(name: "_id")
  String id;
  String email;
  String name;
  String profileImageUrl;
  UserAddress address;
  String about;
  num ratingCount;
  num averageRating;

  List<Product> products;
  List<Review> reviews;
  num reviewCount;
  num reviewAverage;

  UserSettings userSettings;

  User(
      {this.id,
      this.email,
      this.name,
      this.profileImageUrl,
      this.reviews,
      this.reviewCount,
      this.address,
      this.about,
      this.userSettings});

  get averageRatingRounded => averageRating.round();
  get profileImagePath => AppImage.formUrl(profileImageUrl);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

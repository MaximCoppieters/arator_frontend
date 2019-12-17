import 'package:arator/data/model/Address.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Product.dart';
import 'Review.dart';

part 'User.g.dart';

@JsonSerializable(nullable: false)
class User {
  String email;
  String userName;
  String profileImagePath;
  String description;
  Address address;
  String about;

  List<Product> products;
  List<Review> reviews;

  User(
      {this.email,
      this.userName,
      this.profileImagePath,
      this.reviews,
      this.address,
      this.about});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

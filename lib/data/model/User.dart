import 'package:arator/data/model/Address.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';
import 'Product.dart';
import 'Review.dart';

part 'User.g.dart';

@JsonSerializable()
class User implements Model {
  @JsonKey(name: "_id")
  String id;
  String email;
  String name;
  String profileImageUrl;
  Address address;
  String about;

  List<Product> products;
  List<Review> reviews;

  User(
      {this.id,
      this.email,
      this.name,
      this.profileImageUrl,
      this.reviews,
      this.address,
      this.about});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

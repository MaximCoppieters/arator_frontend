import 'package:arator/business/app_image.dart';
import 'package:arator/data/model/units/WeightUnit.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';
import 'User.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product implements Model {
  String id;
  final String name;
  final String type;
  final String imageUrl;
  final String description;
  final num priceInEuro;
  final WeightUnit weightUnit;
  final int amount;
  final User seller;
  dynamic image;

  Product(
      {this.id,
      @required this.name,
      this.imageUrl,
      this.type,
      this.description,
      this.priceInEuro,
      this.weightUnit,
      this.seller,
      this.amount,
      this.image});

  get imagePath => AppImage.formUrl(imageUrl);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

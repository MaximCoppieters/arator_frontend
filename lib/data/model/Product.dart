import 'package:arator/data/model/units/WeightUnit.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'Product.g.dart';

@JsonSerializable(nullable: false)
class Product {
  String id;
  final String name;
  final String imagePath;
  final String type;
  final String description;
  final num priceInEuro;
  final WeightUnit weightUnit;
  final num amount;
  final User seller;

  Product(
      {@required this.name,
      this.imagePath,
      this.type,
      this.description,
      this.priceInEuro,
      this.weightUnit,
      this.seller,
      this.amount,
      this.id});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

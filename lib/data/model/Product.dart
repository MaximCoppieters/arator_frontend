import 'package:arator/business/app_image.dart';
import 'package:arator/data/model/units/WeightUnit.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import 'Model.dart';
import 'User.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product implements Model {
  @JsonKey(name: "_id")
  String id;
  final String name;
  final String type;
  final String imageUrl;
  final String description;
  final num priceInEuro;
  final WeightUnit weightUnit;
  final int amountForSale;
  final User seller;
  dynamic image;

  num amountInCart;

  static final moneyFormatterSettings =
      MoneyFormatterSettings(symbol: "€", decimalSeparator: ",");

  Product(
      {this.id,
      @required this.name,
      this.imageUrl,
      this.type,
      this.description,
      this.priceInEuro,
      this.weightUnit,
      this.seller,
      this.amountForSale,
      this.image});

  get imagePath => AppImage.formUrl(imageUrl);
  get formattedPriceInEuro {
    return FlutterMoneyFormatter(
            amount: priceInEuro, settings: moneyFormatterSettings)
        .output
        .symbolOnLeft;
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
  factory Product.fromJson(dynamic json) {
    if (json is Map) {
      return _$ProductFromJson(json);
    }
    return null;
  }
}

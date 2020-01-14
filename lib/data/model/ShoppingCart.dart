import 'package:arator/data/model/ProductInCart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'ShoppingCart.g.dart';

@JsonSerializable()
class ShoppingCart implements Model {
  List<ProductInCart> productsInCart = [];

  ShoppingCart();

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);
}

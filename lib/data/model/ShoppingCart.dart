import 'package:arator/data/model/Product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'ShoppingCart.g.dart';

@JsonSerializable()
class ShoppingCart extends Model {
  Map<Product, num> _amountsByProduct = {};

  void add(Product product, num amount) {
    _amountsByProduct[product] = amount;
  }

  void remove(Product product) {
    _amountsByProduct[product] = null;
  }

  get products => _amountsByProduct;

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);
}

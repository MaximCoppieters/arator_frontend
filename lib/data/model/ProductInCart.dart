import 'Model.dart';
import 'Product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProductInCart.g.dart';

@JsonSerializable()
class ProductInCart implements Model {
  Product product;
  num amount;

  ProductInCart();

  factory ProductInCart.fromJson(Map<String, dynamic> json) =>
      _$ProductInCartFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInCartToJson(this);
}

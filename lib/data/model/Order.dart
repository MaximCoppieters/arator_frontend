import 'Product.dart';
import 'User.dart';

import 'package:json_annotation/json_annotation.dart';

part 'Order.g.dart';

@JsonSerializable(nullable: false)
class Order {
  List<Product> products;
  User buyer;
  User seller;

  Order({this.products, this.buyer});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

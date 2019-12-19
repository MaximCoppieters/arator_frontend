import 'Model.dart';
import 'Product.dart';
import 'User.dart';

import 'package:json_annotation/json_annotation.dart';

part 'Order.g.dart';

@JsonSerializable()
class Order implements Model {
  List<Product> products;
  User buyer;
  User seller;

  Order({this.products, this.buyer});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

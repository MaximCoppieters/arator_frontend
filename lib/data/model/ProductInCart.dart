import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import 'Model.dart';
import 'Product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProductInCart.g.dart';

@JsonSerializable()
class ProductInCart implements Model {
  Product product;
  num amount;

  static final moneyFormatterSettings =
      MoneyFormatterSettings(symbol: "€", decimalSeparator: ",");

  ProductInCart();

  factory ProductInCart.fromJson(Map<String, dynamic> json) =>
      _$ProductInCartFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInCartToJson(this);

  num calculateSubTotal() {
    return product.priceInEuro * amount;
  }

  get formattedSubtotalInEuro {
    return FlutterMoneyFormatter(
            amount: calculateSubTotal(), settings: moneyFormatterSettings)
        .output
        .symbolOnLeft;
  }
}

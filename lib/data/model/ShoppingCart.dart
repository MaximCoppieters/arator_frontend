import 'package:arator/data/model/ProductInCart.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'ShoppingCart.g.dart';

@JsonSerializable()
class ShoppingCart implements Model {
  List<ProductInCart> productsInCart = [];

  static final moneyFormatterSettings =
      MoneyFormatterSettings(symbol: "€", decimalSeparator: ",");

  ShoppingCart();

  factory ShoppingCart.fromJson(dynamic json) {
    if (json is Map) {
      return _$ShoppingCartFromJson(json);
    }
    return null;
  }
  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);

  num calculateSubTotal() {
    return productsInCart
        .map((productInCart) => productInCart.calculateSubTotal())
        .reduce((current, last) => current + last);
  }

  num calculateBtw() {
    return calculateSubTotal() * 0.06;
  }

  num calculateTotal() {
    return calculateBtw() + calculateSubTotal();
  }

  get formattedSubtotalInEuro {
    return FlutterMoneyFormatter(
            amount: calculateSubTotal(), settings: moneyFormatterSettings)
        .output
        .symbolOnLeft;
  }

  get formattedBtwInEuro {
    return FlutterMoneyFormatter(
            amount: calculateBtw(), settings: moneyFormatterSettings)
        .output
        .symbolOnLeft;
  }

  get formattedTotalInEuro {
    return FlutterMoneyFormatter(
            amount: calculateTotal(), settings: moneyFormatterSettings)
        .output
        .symbolOnLeft;
  }
}

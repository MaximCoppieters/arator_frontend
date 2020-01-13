import 'package:arator/data/model/Product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
}

class AddProductToCart extends ShoppingCartEvent {
  final Product product;
  final num amount;
  AddProductToCart({@required this.product, @required this.amount});
  @override
  List<Object> get props => [product, amount];
}

class RemoveProductFromCart extends ShoppingCartEvent {
  final Product product;
  RemoveProductFromCart({@required this.product});
  @override
  List<Object> get props => [product];
}

class LoadShoppingCart extends ShoppingCartEvent {
  @override
  List<Object> get props => null;
}

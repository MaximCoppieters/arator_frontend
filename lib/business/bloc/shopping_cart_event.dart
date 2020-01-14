import 'package:arator/data/model/Product.dart';
import 'package:arator/data/model/ProductInCart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
}

class AddProductToCart extends ShoppingCartEvent {
  final ProductInCart productInCart;
  AddProductToCart({@required this.productInCart});
  @override
  List<Object> get props => [productInCart];
}

class RemoveProductFromCart extends ShoppingCartEvent {
  final ProductInCart productInCart;
  RemoveProductFromCart({@required this.productInCart});
  @override
  List<Object> get props => [productInCart];
}

class LoadShoppingCart extends ShoppingCartEvent {
  @override
  List<Object> get props => null;
}

class ResetShoppingCartState extends ShoppingCartEvent {
  @override
  List<Object> get props => null;
}

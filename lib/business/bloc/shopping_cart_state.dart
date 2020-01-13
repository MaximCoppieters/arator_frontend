import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:equatable/equatable.dart';

abstract class ShoppingCartState extends Equatable {
  const ShoppingCartState();
}

class InitialShoppingCartState extends ShoppingCartState {
  @override
  List<Object> get props => [];
}

class ShoppingCartLoading extends ShoppingCartState {
  @override
  List<Object> get props => null;
}

class LoadingShoppingCart extends ShoppingCartState {
  @override
  List<Object> get props => null;
}

class ShoppingCartLoaded extends ShoppingCartState {
  final ShoppingCart shoppingCart;
  ShoppingCartLoaded(this.shoppingCart);
  @override
  List<Object> get props => [shoppingCart];
}

class ShoppingCartFailedLoading extends ShoppingCartState {
  final Exception error;
  ShoppingCartFailedLoading(this.error);
  @override
  List<Object> get props => [error];
}

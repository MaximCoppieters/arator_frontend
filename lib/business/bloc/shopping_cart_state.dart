import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
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

class DeletingItem extends ShoppingCartLoaded {
  DeletingItem(ShoppingCart shoppingCart) : super(shoppingCart);
}

class ShoppingCartFailedLoading extends ShoppingCartState {
  final FormException error;

  ShoppingCartFailedLoading(this.error);
  @override
  List<Object> get props => [error];
}

class ItemDeletionFailed extends ShoppingCartLoaded {
  final FormException error;

  ItemDeletionFailed(this.error, ShoppingCart shoppingCart)
      : super(shoppingCart);
  @override
  List<Object> get props => [shoppingCart, error];
}

class ItemDeleted extends ShoppingCartLoaded {
  ItemDeleted(ShoppingCart shoppingCart) : super(shoppingCart);
}

class AddingItem extends ShoppingCartState {
  @override
  List<Object> get props => [];
}

class AddItemFailed extends ShoppingCartFailedLoading {
  AddItemFailed(FormException error) : super(error);
}

class ItemAdded extends ShoppingCartState {
  @override
  List<Object> get props => null;
}

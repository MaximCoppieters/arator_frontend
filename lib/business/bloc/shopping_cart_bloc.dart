import 'dart:async';
import 'package:arator/data/model/ProductInCart.dart';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/data/repo/shopping_cart_repo.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartRepository shoppingCartRepository =
      ShoppingCartRepository();
  ShoppingCart shoppingCart;

  @override
  ShoppingCartState get initialState => InitialShoppingCartState();

  @override
  Stream<ShoppingCartState> mapEventToState(
    ShoppingCartEvent event,
  ) async* {
    if (event is AddProductToCart) {
      ProductInCart productInCart = event.props[0];
      yield* _mapAddProductToShoppingCart(productInCart);
    } else if (event is RemoveProductFromCart) {
      ProductInCart productInCart = event.props[0];
      yield* _mapRemoveProductFromShoppingCart(productInCart);
    } else if (event is LoadShoppingCart) {
      yield* _mapLoadShoppingCart();
    } else if (event is ResetShoppingCartState) {
      yield InitialShoppingCartState();
    }
  }

  Stream<ShoppingCartState> _mapAddProductToShoppingCart(
      ProductInCart productInCart) async* {
    yield AddingItem();
    try {
      this.shoppingCart.productsInCart.add(productInCart);
      await this.shoppingCartRepository.updateShoppingCart(shoppingCart);
      yield ItemAdded();
    } catch (error) {
      print(error);
      yield AddItemFailed(error);
    }
  }

  Stream<ShoppingCartState> _mapRemoveProductFromShoppingCart(
      ProductInCart productInCart) async* {
    yield DeletingItem(this.shoppingCart);
    try {
      shoppingCart.productsInCart.remove(productInCart);
      await this.shoppingCartRepository.updateShoppingCart(shoppingCart);
      yield ShoppingCartLoaded(this.shoppingCart);
    } catch (error) {
      yield ItemDeletionFailed(error, this.shoppingCart);
    }
  }

  Stream<ShoppingCartState> _mapLoadShoppingCart() async* {
    yield ShoppingCartLoading();
    try {
      this.shoppingCart = await this.shoppingCartRepository.getShoppingCart();
      yield ShoppingCartLoaded(this.shoppingCart);
    } catch (error) {
      yield ShoppingCartFailedLoading(error);
    }
  }
}

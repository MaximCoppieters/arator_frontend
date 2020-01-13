import 'dart:async';
import 'package:arator/data/model/Product.dart';
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
      Product product = event.props[0];
      num amount = event.props[1];
      yield* _mapAddProductToShoppingCart(product, amount);
    } else if (event is RemoveProductFromCart) {
      Product product = event.props[0];
      yield* _mapRemoveProductFromShoppingCart(product);
    } else if (event is LoadShoppingCart) {
      yield* _mapLoadShoppingCart();
    }
  }

  Stream<ShoppingCartState> _mapAddProductToShoppingCart(
      product, amount) async* {
    yield ShoppingCartLoading();
    try {
      shoppingCart.add(product, amount);
      this.shoppingCartRepository.updateShoppingCart(shoppingCart);
      yield ShoppingCartLoaded(this.shoppingCart);
    } catch (error) {
      yield ShoppingCartFailedLoading(error);
    }
  }

  Stream<ShoppingCartState> _mapRemoveProductFromShoppingCart(
      Product product) async* {
    yield ShoppingCartLoading();
    try {
      shoppingCart.remove(product);
      this.shoppingCartRepository.updateShoppingCart(shoppingCart);
      yield ShoppingCartLoaded(this.shoppingCart);
    } catch (error) {
      yield ShoppingCartFailedLoading(error);
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

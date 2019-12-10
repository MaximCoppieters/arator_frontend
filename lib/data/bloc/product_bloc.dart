import 'dart:async';
import 'package:arator/data/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import '../Produce.dart';
import './bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepository();

  @override
  ProductState get initialState => InitialProductState();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProducts) {
      yield* _mapLoadProductsToState();
    } else if (event is AddProduct) {
      _mapAddProductToState(event.product);
    }
  }

  Future<void> _mapAddProductToState(Produce product) async {
    this.productRepository.getProducts();
  }

  Stream<ProductState> _mapLoadProductsToState() async* {
    try {
      final products = await this.productRepository.getProducts();
      yield ProductsLoaded(
        products.toList(),
      );
    } catch (_) {
      yield ProductsNotLoaded();
    }
  }
}

import 'dart:async';
import 'package:arator/data/model/Product.dart';
import 'package:arator/data/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

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
      yield* _mapAddProductToState(event.product);
    }
  }

  Stream<ProductState> _mapAddProductToState(Product product) async* {
    yield ProductsLoading();
    try {
      await this.productRepository.addProduct(product);
      yield ProductAdded();
    } catch (error) {
      yield AddProductFailed(error);
    }
  }

  Stream<ProductState> _mapLoadProductsToState() async* {
    yield ProductsLoading();
    try {
      final products = await this.productRepository.getProducts();
      print(products);
      yield ProductsLoaded(
        products.toList(),
      );
    } catch (error) {
      yield ProductsFailedLoading(error);
    }
  }
}

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
    if (event is GetProductsForSale) {
      yield* _mapLoadPersonalProductsToState();
    } else if (event is GetPersonalProducts) {
      yield* _mapLoadProductsForSaleToState();
    } else if (event is AddProduct) {
      yield* _mapAddProductToState(event.product);
    } else if (event is ResetProductEvent) {
      yield InitialProductState();
    }
  }

  Stream<ProductState> _mapAddProductToState(Product product) async* {
    yield ProductsLoading();
    try {
      await this.productRepository.addProduct(product);
      yield ProductAdded();
      yield InitialProductState();
      print("added");
    } catch (error) {
      print(error);
      yield AddProductFailed(error);
    }
  }

  Stream<ProductState> _mapLoadPersonalProductsToState() async* {
    yield ProductsLoading();
    try {
      final personalProducts =
          await this.productRepository.getPersonalProducts();
      yield ProductsLoaded(
        personalProducts.toList(),
      );
      print(personalProducts);
    } catch (error) {
      print(error);
      yield ProductsFailedLoading(error);
    }
  }

  Stream<ProductState> _mapLoadProductsForSaleToState() async* {
    yield ProductsLoading();
    try {
      final products = await this.productRepository.getProducts();
      yield ProductsLoaded(
        products.toList(),
      );
    } catch (error) {
      yield ProductsFailedLoading(error);
    }
  }
}

import 'dart:async';
import 'package:arator/data/model/Product.dart';
import 'package:arator/data/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

abstract class ProductBloc extends Bloc<ProductEvent, ProductState> {
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
    } else if (event is ResetProductEvent) {
      yield InitialProductState();
    }
  }

  Stream<ProductState> _mapLoadProductsToState();

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
}

class BuyerProductBloc extends ProductBloc {
  @override
  Stream<ProductState> _mapLoadProductsToState() async* {
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

class SellerProductBloc extends ProductBloc {
  @override
  Stream<ProductState> _mapLoadProductsToState() async* {
    yield ProductsLoading();
    try {
      final personalProducts =
          await this.productRepository.getPersonalProducts();
      yield ProductsLoaded(
        personalProducts.toList(),
      );
    } catch (error) {
      print(error);
      yield ProductsFailedLoading(error);
    }
  }
}

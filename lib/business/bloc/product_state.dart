import 'package:arator/data/model/Product.dart';
import 'package:equatable/equatable.dart';


abstract class ProductState extends Equatable {
  const ProductState();
}

class InitialProductState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductState {
  ProductsLoading();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Products are loading';
}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded(this.products);
  @override
  List<Object> get props => [products];

  @override
  String toString() => 'ProductsLoaded { products: $products }';
}

class ProductsNotLoaded extends ProductState {
  @override
  String toString() => 'Products failed to load';

  @override
  List<Object> get props => [];
}

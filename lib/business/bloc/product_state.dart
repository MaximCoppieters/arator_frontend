import 'package:arator/data/model/Product.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
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

class ProductsFailedLoading extends ProductState {
  final FormException error;
  ProductsFailedLoading(this.error);
  @override
  String toString() => 'Products failed to load';
  @override
  List<Object> get props => [error];
}

class ProductAdded extends ProductState {
  @override
  List<Object> get props => [];
}

class AddProductFailed extends ProductState {
  final FormException error;
  AddProductFailed(this.error);

  @override
  String toString() => 'Failed to add product';

  @override
  List<Object> get props => [error];
}

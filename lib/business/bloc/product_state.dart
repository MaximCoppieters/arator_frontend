import 'package:arator/data/model/Product.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class InitialProductState extends ProductState {
  @override
  List<Object> get props => null;
}

class ProductsLoading extends ProductState {
  ProductsLoading();
  @override
  List<Object> get props => null;
}

class ProductsLoaded extends ProductState {
  final List<Product> products;
  ProductsLoaded(this.products);
  @override
  List<Object> get props => [products];
}

class ProductsFailedLoading extends ProductState {
  final FormException error;
  ProductsFailedLoading(this.error);
  @override
  List<Object> get props => [error];
}

class ProductAdded extends ProductState {
  @override
  List<Object> get props => null;
}

class AddProductFailed extends ProductState {
  final FormException error;
  AddProductFailed(this.error);
  @override
  List<Object> get props => [error];
}

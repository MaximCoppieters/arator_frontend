import 'package:equatable/equatable.dart';

import '../Produce.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProduct extends ProductEvent {
  final Produce product;
  AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class GetProducts extends ProductEvent {
  @override
  List<Object> get props => [];
}

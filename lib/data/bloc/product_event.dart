import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}

class GetProducts extends ProductEvent {
  @override
  List<Object> get props => [];
}

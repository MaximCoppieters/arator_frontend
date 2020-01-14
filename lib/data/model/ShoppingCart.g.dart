// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShoppingCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) {
  return ShoppingCart()
    ..productsInCart = (json['productsInCart'] as List)
        ?.map((e) => e == null
            ? null
            : ProductInCart.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ShoppingCartToJson(ShoppingCart instance) =>
    <String, dynamic>{
      'productsInCart': instance.productsInCart,
    };

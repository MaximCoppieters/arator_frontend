// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductInCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInCart _$ProductInCartFromJson(Map<String, dynamic> json) {
  return ProductInCart()
    ..product =
        json['product'] == null ? null : Product.fromJson(json['product'])
    ..amount = json['amount'] as num;
}

Map<String, dynamic> _$ProductInCartToJson(ProductInCart instance) =>
    <String, dynamic>{
      'product': instance.product,
      'amount': instance.amount,
    };

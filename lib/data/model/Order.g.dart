// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    products: (json['products'] as List)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    buyer: User.fromJson(json['buyer'] as Map<String, dynamic>),
  )..seller = User.fromJson(json['seller'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'products': instance.products,
      'buyer': instance.buyer,
      'seller': instance.seller,
    };

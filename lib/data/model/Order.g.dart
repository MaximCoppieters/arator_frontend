// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    products: (json['products'] as List)
        ?.map((e) => e == null ? null : Product.fromJson(e))
        ?.toList(),
    buyer: json['buyer'] == null
        ? null
        : User.fromJson(json['buyer'] as Map<String, dynamic>),
  )..seller = json['seller'] == null
      ? null
      : User.fromJson(json['seller'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'products': instance.products,
      'buyer': instance.buyer,
      'seller': instance.seller,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['_id'] as String,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    type: json['type'] as String,
    description: json['description'] as String,
    priceInEuro: json['priceInEuro'] as num,
    weightUnit: _$enumDecodeNullable(_$WeightUnitEnumMap, json['weightUnit']),
    seller: json['seller'] == null ? null : User.fromJson(json['seller']),
    amountForSale: json['amountForSale'] as int,
    image: json['image'],
  )..amountInCart = json['amountInCart'] as num;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'priceInEuro': instance.priceInEuro,
      'weightUnit': _$WeightUnitEnumMap[instance.weightUnit],
      'amountForSale': instance.amountForSale,
      'seller': instance.seller,
      'image': instance.image,
      'amountInCart': instance.amountInCart,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$WeightUnitEnumMap = {
  WeightUnit.Kilogram: 'Kilogram',
  WeightUnit.Gram: 'Gram',
  WeightUnit.Lbs: 'Lbs',
};

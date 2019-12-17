// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    name: json['name'] as String,
    imagePath: json['imagePath'] as String,
    type: json['type'] as String,
    description: json['description'] as String,
    priceInEuro: json['priceInEuro'] as num,
    weightUnit: _$enumDecode(_$WeightUnitEnumMap, json['weightUnit']),
    seller: User.fromJson(json['seller'] as Map<String, dynamic>),
    amount: json['amount'] as num,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'type': instance.type,
      'description': instance.description,
      'priceInEuro': instance.priceInEuro,
      'weightUnit': _$WeightUnitEnumMap[instance.weightUnit],
      'amount': instance.amount,
      'seller': instance.seller,
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

const _$WeightUnitEnumMap = {
  WeightUnit.KILOGRAM: 'KILOGRAM',
  WeightUnit.GRAM: 'GRAM',
  WeightUnit.LBS: 'LBS',
};

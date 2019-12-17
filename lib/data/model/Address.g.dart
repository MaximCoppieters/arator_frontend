// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    street: json['street'] as String,
    number: json['number'] as String,
    postalCode: json['postalCode'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'postalCode': instance.postalCode,
      'country': instance.country,
    };

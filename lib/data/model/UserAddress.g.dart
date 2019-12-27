// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserAddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) {
  return UserAddress(
    addressLine: json['addressLine'] as String,
  )
    ..latitude = json['latitude'] as num
    ..longitude = json['longitude'] as num
    ..city = json['city'] as String
    ..zipcode = json['zipcode'] as String
    ..streetName = json['streetName'] as String
    ..streetNumber = json['streetNumber'] as String
    ..country = json['country'] as String;
}

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'addressLine': instance.addressLine,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'streetName': instance.streetName,
      'streetNumber': instance.streetNumber,
      'country': instance.country,
    };

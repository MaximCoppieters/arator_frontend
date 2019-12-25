// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserSettings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings(
    maxProductDistance: json['maxProductDistance'] as num,
    useGpsLocation: json['useGpsLocation'] as bool,
  );
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'maxProductDistance': instance.maxProductDistance,
      'useGpsLocation': instance.useGpsLocation,
    };

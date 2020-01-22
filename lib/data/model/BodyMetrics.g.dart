// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyMetrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyMetrics _$BodyMetricsFromJson(Map<String, dynamic> json) {
  return BodyMetrics(
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    weight: json['weight'] as num,
    age: json['age'] as num,
  )..bmi = json['bmi'] as num;
}

Map<String, dynamic> _$BodyMetricsToJson(BodyMetrics instance) =>
    <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender],
      'weight': instance.weight,
      'age': instance.age,
      'bmi': instance.bmi,
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

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};

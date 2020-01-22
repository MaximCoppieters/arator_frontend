import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'BodyMetrics.g.dart';

@JsonSerializable()
class BodyMetrics implements Model {
  final Gender gender;
  final num weight;
  final num age;
  num bmi;

  BodyMetrics({this.gender, @required this.weight, @required this.age});

  factory BodyMetrics.fromJson(dynamic json) {
    if (json is Map) {
      return _$BodyMetricsFromJson(json);
    }
    return null;
  }
  Map<String, dynamic> toJson() => _$BodyMetricsToJson(this);
}

enum Gender { MALE, FEMALE }

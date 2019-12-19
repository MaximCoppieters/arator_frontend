import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address implements Model {
  String street;
  String number;
  String postalCode;
  String country;

  Address({this.street, this.number, this.postalCode, this.country});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

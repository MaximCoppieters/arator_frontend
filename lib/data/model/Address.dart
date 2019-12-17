import 'package:json_annotation/json_annotation.dart';

part 'Address.g.dart';

@JsonSerializable(nullable: false)
class Address {
  String street;
  String number;
  String postalCode;
  String country;

  Address({this.street, this.number, this.postalCode, this.country});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

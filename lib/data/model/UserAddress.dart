import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'UserAddress.g.dart';

@JsonSerializable()
class UserAddress implements Model {
  @JsonKey(nullable: true)
  String addressLine;

  @JsonKey(nullable: true)
  List<num> position;
  @JsonKey(nullable: true)
  String city;
  @JsonKey(nullable: true)
  String zipcode;
  @JsonKey(nullable: true)
  String streetName;
  @JsonKey(nullable: true)
  String streetNumber;
  @JsonKey(nullable: true)
  String country;

  UserAddress({this.addressLine});

  factory UserAddress.fromJson(dynamic json) {
    if (json is Map) {
      return _$UserAddressFromJson(json);
    }
    return null;
  }
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}

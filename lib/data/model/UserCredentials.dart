import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'UserCredentials.g.dart';

@JsonSerializable()
class UserCredentials implements Model {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const UserCredentials(
      {this.email, this.password, this.confirmPassword, this.name});

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);
  // Custom toJson to avoid validation error on backend (absence of fields)
  Map<String, dynamic> toJson() {
    var map = {
      "email": email,
      "password": password,
    };
    if (confirmPassword != null) {
      map["confirmPassword"] = confirmPassword;
    }
    if (name != null) {
      map["name"] = name;
    }
    return map;
  }
}

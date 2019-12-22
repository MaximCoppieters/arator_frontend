import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'AuthenticationDetails.g.dart';

@JsonSerializable()
class AuthenticationDetails {
  User user;
  String token;

  AuthenticationDetails(this.user, this.token);

  factory AuthenticationDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationDetailsToJson(this);
}

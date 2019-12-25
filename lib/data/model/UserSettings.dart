import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'UserSettings.g.dart';

@JsonSerializable()
class UserSettings implements Model {
  num maxProductDistance;
  bool useGpsLocation;

  UserSettings({this.maxProductDistance, this.useGpsLocation});

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

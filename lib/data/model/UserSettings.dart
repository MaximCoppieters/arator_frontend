import 'package:json_annotation/json_annotation.dart';

import 'Model.dart';

part 'UserSettings.g.dart';

@JsonSerializable()
class UserSettings implements Model {
  num maxProductDistance;
  bool useGpsLocation;

  UserSettings({this.maxProductDistance, this.useGpsLocation});

  factory UserSettings.fromJson(dynamic json) {
    if (json is Map) {
      return _$UserSettingsFromJson(json);
    }
    return null;
  }
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

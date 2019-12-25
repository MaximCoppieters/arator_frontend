import 'package:arator/data/model/UserSettings.dart';
import 'package:equatable/equatable.dart';

abstract class UserSettingsEvent extends Equatable {
  const UserSettingsEvent();
}

class ChangeUserSettings extends UserSettingsEvent {
  final UserSettings _userSettings;
  ChangeUserSettings(this._userSettings);
  @override
  List<Object> get props => [_userSettings];
}

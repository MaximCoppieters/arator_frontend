import 'dart:async';
import 'package:arator/business/bloc/user_settings_state.dart';
import 'package:arator/data/model/UserSettings.dart';
import 'package:arator/data/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserSettingsBloc extends Bloc<UserSettingsEvent, UserSettingsState> {
  UserRepository _userRepository = UserRepository();

  UserSettingsBloc();

  @override
  UserSettingsState get initialState => InitialUserSettingsState();

  @override
  Stream<UserSettingsState> mapEventToState(
    UserSettingsEvent event,
  ) async* {
    try {
      yield UserSettingsChanging();
      UserSettings userSettings = event.props[0];
      await this._userRepository.updateUserSettings(userSettings: userSettings);
      yield UserSettingsChanged();
    } catch (error) {
      yield UserSettingsChangeFailed(error);
    }
  }
}

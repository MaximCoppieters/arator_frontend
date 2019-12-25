import 'dart:io';

import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:equatable/equatable.dart';

abstract class UserSettingsState extends Equatable {
  const UserSettingsState();
}

class InitialUserSettingsState extends UserSettingsState {
  @override
  List<Object> get props => [];
}

class UserSettingsChanging extends UserSettingsState {
  @override
  List<Object> get props => null;
}

class UserSettingsChanged extends UserSettingsState {
  @override
  List<Object> get props => null;
}

class UserSettingsChangeFailed extends UserSettingsState {
  final FormException error;
  UserSettingsChangeFailed(this.error);
  @override
  List<Object> get props => [error];
}

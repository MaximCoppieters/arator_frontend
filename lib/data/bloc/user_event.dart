import 'package:arator/data/UserCredentials.dart';
import 'package:equatable/equatable.dart';

import '../User.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoginUser extends UserEvent {
  final UserCredentials userCredentials;
  LoginUser(this.userCredentials);

  @override
  List<Object> get props => [userCredentials];
}

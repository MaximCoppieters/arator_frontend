import 'package:arator/data/model/User.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final String token;
  final User user;

  LoggedIn({this.token, this.user});

  @override
  String toString() => 'LoggedIn { token: $token }';

  @override
  List<Object> get props => [token, user];
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => [];
}

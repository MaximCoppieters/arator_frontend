import 'package:arator/data/User.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class InitialUserState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  UserLoading();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'User is loading';
}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserLoaded { user: $user }';
}

class UserNotLoaded extends UserState {
  @override
  String toString() => 'User failed to load';

  @override
  List<Object> get props => [];
}

import 'package:arator/data/model/User.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class InitialUserState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingUserDetails extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);

  @override
  List<Object> get props => [];
}

class UserLoadFailed extends UserState {
  final Exception error;
  UserLoadFailed(this.error);

  @override
  List<Object> get props => [error];
}

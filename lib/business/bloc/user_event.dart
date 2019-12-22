import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  const LoadUser();

  @override
  List<Object> get props => [];
  @override
  String toString() => 'Loading user';
}

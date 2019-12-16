import 'package:arator/data/UserCredentials.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final UserCredentials userCredentials;

  const LoginButtonPressed({
    @required this.userCredentials,
  });

  @override
  List<Object> get props => [userCredentials];

  @override
  String toString() => 'LoginButtonPressed { user: $userCredentials }';
}

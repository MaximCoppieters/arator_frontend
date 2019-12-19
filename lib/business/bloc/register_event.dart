import 'package:arator/data/model/UserCredentials.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final UserCredentials userCredentials;

  const RegisterButtonPressed({
    @required this.userCredentials,
  });

  @override
  List<Object> get props => [userCredentials];

  @override
  String toString() => 'RegisterButtonPressed { user: $userCredentials }';
}

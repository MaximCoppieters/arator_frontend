import 'package:arator/utils/exceptions/authentication_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterFailure extends RegisterState {
  final AuthenticationException error;

  const RegisterFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: ${error.message} }';
}

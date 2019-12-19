import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
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
  final FormException error;

  const RegisterFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() =>
      'RegisterFailure { field: ${error.field}, message: ${error.message} }';
}

class RegisterComplete extends RegisterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Register complete';
}

import 'package:arator/utils/enums/input_name.dart';
import 'package:flutter/material.dart';

class FormException implements Exception {
  final InputName field;
  final String message;

  FormException({this.field, @required this.message});
}

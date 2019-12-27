import 'package:flutter/material.dart';

class GpsException implements Exception {
  final String message;

  GpsException({@required this.message});

  @override
  String toString() {
    return "GpsException: { message: $message }";
  }
}

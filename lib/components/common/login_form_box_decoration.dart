import 'package:flutter/material.dart';

BoxDecoration authFormDecoration({bool hasBorder}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
          color: hasBorder ? Colors.green : Colors.white, width: 3.0));
}

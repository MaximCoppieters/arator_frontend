import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';

BoxDecoration authFormDecoration({bool hasBorder}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
          color: hasBorder ? AratorTheme.primaryColor : Colors.white,
          width: 3.0));
}

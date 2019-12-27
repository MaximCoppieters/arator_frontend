import 'package:arator/style/theme.dart';
import 'package:flutter/material.dart';

class AppStyles {
  final TextStyle authButtonTextStyle =
      TextStyle(color: AratorTheme.onPrimary, fontSize: 24.0);

  final headlineStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AratorTheme.headLineFontSize,
      color: AratorTheme.onBackground);

  final titleStyle = TextStyle(
      fontSize: AratorTheme.titleFontSize,
      fontWeight: FontWeight.bold,
      color: AratorTheme.onBackgroundLight);
}

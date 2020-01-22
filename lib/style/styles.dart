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

  final bmiLabelStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );

  final kNumberStyle = TextStyle(
      fontSize: 50.0, fontWeight: FontWeight.w900, color: Colors.white);

  final kLargeButtonStyle =
      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);

  final kTitleStyle = TextStyle(
      fontSize: 50.0,
      fontWeight: FontWeight.bold,
      color: AratorTheme.primaryColor);

  final kResultStyle = TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white);

  final kBMIStyle = TextStyle(
      fontSize: 100.0, fontWeight: FontWeight.bold, color: Colors.white);

  final kBodyStyle = TextStyle(
    fontSize: 22.0,
    color: Colors.white,
  );
}

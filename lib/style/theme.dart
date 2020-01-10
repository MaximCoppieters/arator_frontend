import 'package:arator/style/styles.dart';
import 'package:flutter/material.dart';

class AratorTheme {
  static final primaryColor = Color(0xFF2b8c5b);
  static final secondaryColor = Colors.blueGrey;
  static final primaryVariantColor = Color(0xFFa7d391);
  static final onPrimary = Colors.white;
  static final background = Colors.grey[50];
  static final onBackground = Colors.black;
  static final onBackgroundLight = Colors.black54;
  static final onSecondary = Colors.white;
  static final onError = Colors.white;
  static final onSurface = Colors.black;
  static final surface = Colors.white;

  static final authGradientStart = Color(0xFFFFFF);
  static final authGradientEnd = Color(0xb0d8a4);

  static final titleFontSize = 14.0;
  static final headLineFontSize = 16.0;

  static final AppStyles styles = AppStyles();

  static final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      background: background,
      error: Colors.red,
      onBackground: onBackground,
      onError: onError,
      secondary: Colors.blueGrey,
      onSecondary: onSecondary,
      primaryVariant: primaryVariantColor,
      secondaryVariant: secondaryColor[800],
      surface: surface,
      onSurface: onSurface);

  static get theme {
    return ThemeData(
        accentColor: secondaryColor,
        backgroundColor: background,
        primaryColor: primaryColor,
        colorScheme: colorScheme,
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(side: BorderSide.none),
            elevation: 0.5),
        scaffoldBackgroundColor: background,
        buttonTheme: ButtonThemeData(colorScheme: colorScheme),
        appBarTheme: AppBarTheme(
            color: Colors.grey[50],
            elevation: 0,
            iconTheme: IconThemeData(color: primaryColor),
            textTheme: TextTheme(
                title: TextStyle(
                    color: primaryColor, fontSize: 20.0, fontFamily: "Lato"))),
        errorColor: Colors.red,
        tabBarTheme: TabBarTheme(labelColor: Colors.grey[900]),
        textTheme: TextTheme(
          headline: TextStyle(
              fontSize: 16.0, fontFamily: 'Lato', fontWeight: FontWeight.bold),
          title: TextStyle(
              fontSize: 16.0, fontFamily: 'Lato', fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica'),
          button: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica'),
        ));
  }
}

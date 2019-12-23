import 'package:flutter/material.dart';

class AratorTheme {
  static final primaryColor = Colors.green[400];
  static final secondaryColor = Colors.deepOrange;
  static final primaryAccentColor = Color(0xb0d8a4);
  static final onPrimary = Colors.white;
  static final onBackground = Colors.black12;
  static final onSecondary = Colors.white;
  static final onError = Colors.white;

  static const Color loginGradientStart = const Color(0xFFFFFF);
  static const Color loginGradientEnd = const Color(0xb0d8a4);

  static final TextStyle authButtonTextStyle =
      TextStyle(color: onPrimary, fontSize: 24.0);

  static get theme {
    return ThemeData(
        accentColor: secondaryColor,
        backgroundColor: Colors.green[50],
        primaryColor: primaryColor,
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: Colors.white,
            background: Colors.grey[50],
            error: Colors.red,
            onBackground: Colors.black12,
            onError: Colors.white,
            secondary: secondaryColor,
            onSecondary: Colors.white,
            primaryVariant: Colors.green[800],
            secondaryVariant: Colors.deepOrange[600],
            surface: Colors.white,
            onSurface: Colors.black12),
        scaffoldBackgroundColor: Colors.green[50],
        buttonTheme: ButtonThemeData(
            buttonColor: primaryColor, textTheme: ButtonTextTheme.primary),
        appBarTheme: AppBarTheme(
            color: Colors.grey[50],
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.green),
            textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.green, fontSize: 20.0, fontFamily: "Lato"))),
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

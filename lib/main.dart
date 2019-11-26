import 'package:arator/app.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'data/FruitModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: FruitModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.green,
            accentColor: Colors.deepOrange,
            backgroundColor: Colors.grey[50],
            scaffoldBackgroundColor: Colors.grey[50],
            appBarTheme: AppBarTheme(
                color: Colors.grey[50],
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.green),
                textTheme: TextTheme(
                    title: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontFamily: "Lato"))),
            errorColor: Colors.red,
            tabBarTheme: TabBarTheme(labelColor: Colors.grey[900]),
            textTheme: TextTheme(
              headline: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),
              title: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),
              body1: TextStyle(fontSize: 10.0, fontFamily: 'Helvetica'),
              button: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica'),
            )),
        home: App(),
      ),
    );
  }
}

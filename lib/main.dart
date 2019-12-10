import 'package:arator/app.dart';
import 'package:arator/data/bloc/bloc.dart';
import 'package:arator/pages/common/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        title: 'Arator',
        theme: ThemeData(
            primaryColor: Colors.green,
            accentColor: Colors.deepOrange,
            backgroundColor: Colors.grey[50],
            scaffoldBackgroundColor: Colors.grey[50],
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.green, textTheme: ButtonTextTheme.primary),
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
              body1: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica'),
              button: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica'),
            )),
        home: LoginPage(),
      ),
    );
  }
}

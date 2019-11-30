import 'package:flutter/material.dart';

class PreferencesOverviewPage extends StatefulWidget {
  @override
  _PreferencesOverviewPageState createState() =>
      _PreferencesOverviewPageState();
}

class _PreferencesOverviewPageState extends State<PreferencesOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Text("Add Friend"),
    );
  }
}

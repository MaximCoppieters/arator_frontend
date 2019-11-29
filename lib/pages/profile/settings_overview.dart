import 'package:flutter/material.dart';

class SettingsOverviewPage extends StatefulWidget {
  @override
  _SettingsOverviewPageState createState() => _SettingsOverviewPageState();
}

class _SettingsOverviewPageState extends State<SettingsOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Overview"),
      ),
      body: Text("Settings Overview"),
    );
  }
}

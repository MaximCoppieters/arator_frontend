import 'package:flutter/material.dart';

class MessageOverviewPage extends StatefulWidget {
  @override
  _MessageOverviewPageState createState() => _MessageOverviewPageState();
}

class _MessageOverviewPageState extends State<MessageOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Text("Message Overview"),
    );
  }
}

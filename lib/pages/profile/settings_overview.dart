import 'package:arator/components/maps/map_address_picker.dart';
import 'package:flutter/material.dart';

class SettingsOverview extends StatefulWidget {
  @override
  _SettingsOverviewState createState() => _SettingsOverviewState();
}

class _SettingsOverviewState extends State<SettingsOverview> {
  @override
  Widget build(BuildContext context) {
    return MapAddressPicker();
  }
}

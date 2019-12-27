import 'package:flutter/material.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';

class MapLocation {
  final Position position;
  final Address address;

  MapLocation({@required this.position, @required this.address});
}

import 'package:flutter/material.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';

import 'Model.dart';

class MapLocation implements Model {
  final Position position;
  final Address address;

  MapLocation({@required this.position, this.address});

  factory MapLocation.fromJson(Map<String, dynamic> json) {
    return MapLocation(
        position: Position.fromMap(json["position"]),
        address: Address.fromMap(json["address"]));
  }
  Map<String, dynamic> toJson() {
    return {"position": position?.toJson(), "address": this.address?.toMap()};
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAddressPicker extends StatefulWidget {
  @override
  State<MapAddressPicker> createState() => MapAddressPickerState();
}

class MapAddressPickerState extends State<MapAddressPicker> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _userLocationCamera = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _userLocationCamera,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

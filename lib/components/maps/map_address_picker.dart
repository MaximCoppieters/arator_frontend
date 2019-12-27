import 'dart:async';

import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/location_bloc.dart';
import 'package:arator/components/elements/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapAddressPicker extends StatefulWidget {
  final Position startingPosition;

  MapAddressPicker({@required this.startingPosition});

  @override
  State<MapAddressPicker> createState() => MapAddressPickerState();
}

class MapAddressPickerState extends State<MapAddressPicker> {
  Completer<GoogleMapController> _controller = Completer();
  LocationBloc _locationBloc;
  Marker _homeMarker;

  @override
  initState() {
    _locationBloc = BlocProvider.of<LocationBloc>(context);
    super.initState();
  }

  CameraPosition _cameraPosition(Position position) {
    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
        bloc: _locationBloc,
        builder: (context, locationState) {
          return Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition(widget.startingPosition),
                myLocationEnabled: true,
                markers: _homeMarker != null ? {_homeMarker} : null,
                onTap: (LatLng tappedCoordinates) {
                  Position position = Position(
                      latitude: tappedCoordinates.latitude,
                      longitude: tappedCoordinates.longitude);
                  _locationBloc.add(GetMapLocation(position));
                  placeAddressMarker(tappedCoordinates);
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Positioned(
                right: 5.0,
                bottom: 5.0,
                child: AppButton(
                  child: Text("My Location"),
                  onPressed: () {
                    _locationBloc.add(GetUserLocation());
                  },
                ),
              ),
              locationState is LocationLoading
                  ? Positioned(
                      top: 10.0, left: 5.0, child: CircularProgressIndicator())
                  : Container(),
            ],
          );
        });
  }

  void placeAddressMarker(LatLng position) {
    _homeMarker = Marker(position: position, markerId: MarkerId("address"));
  }
}

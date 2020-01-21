import 'dart:async';

import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/location_bloc.dart';
import 'package:arator/components/elements/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShoppingRouteMap extends StatefulWidget {
  final Position startingPosition;

  ShoppingRouteMap({@required this.startingPosition});

  @override
  State<ShoppingRouteMap> createState() => ShoppingRouteMapState();
}

class ShoppingRouteMapState extends State<ShoppingRouteMap> {
  Completer<GoogleMapController> _controller = Completer();
  LocationBloc _locationBloc;
  Marker _homeMarker;

  Set<Polyline> polylines = Set();

  @override
  initState() {
    _locationBloc = BlocProvider.of<LocationBloc>(context);
    print(widget.startingPosition);
    super.initState();
  }

  Set<Polyline> createLines() {
    Set<Polyline> polylines = Set();
    return polylines;
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
                polylines: polylines,
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition(widget.startingPosition),
                myLocationEnabled: true,
                markers: _homeMarker != null ? {_homeMarker} : null,
                onTap: (LatLng tappedCoordinates) {},
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ],
          );
        });
  }
}

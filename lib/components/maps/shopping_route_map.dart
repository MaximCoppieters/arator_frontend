import 'dart:async';

import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/location_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShoppingRouteMap extends StatefulWidget {
  final Position startingPosition;
  final Set<Marker> shoppingStops;

  ShoppingRouteMap(
      {@required this.startingPosition, @required this.shoppingStops});

  @override
  State<ShoppingRouteMap> createState() => ShoppingRouteMapState();
}

class ShoppingRouteMapState extends State<ShoppingRouteMap> {
  Completer<GoogleMapController> _controller = Completer();
  LocationBloc _locationBloc;
  Marker _homeMarker;
  PolylinePoints polylinePoints = PolylinePoints();
  List<PointLatLng> polypoints;

  @override
  initState() {
    _locationBloc = BlocProvider.of<LocationBloc>(context);
    super.initState();
  }

  @override
  dispose() {
    _locationBloc.close();
    super.dispose();
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
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition(widget.startingPosition),
            myLocationEnabled: true,
            markers: widget.shoppingStops,
            onTap: (LatLng tappedCoordinates) {},
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          );
        });
  }
}

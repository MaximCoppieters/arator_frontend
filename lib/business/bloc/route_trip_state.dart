import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class RouteTripState extends Equatable {
  const RouteTripState();
}

class InitialRouteTripState extends RouteTripState {
  @override
  List<Object> get props => [];
}

class RouteTripsLoading extends RouteTripState {
  @override
  List<Object> get props => null;
}

class RouteTripsLoaded extends RouteTripState {
  final Set<Marker> shoppingStop;

  RouteTripsLoaded(this.shoppingStop);
  @override
  List<Object> get props => [shoppingStop];
}

class RouteTripsFailedLoading extends RouteTripState {
  final Exception error;

  RouteTripsFailedLoading(this.error);
  @override
  List<Object> get props => [];
}

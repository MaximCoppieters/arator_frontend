import 'dart:async';
import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/data/repo/shopping_cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './bloc.dart';

class RouteTripBloc extends Bloc<RouteTripEvent, RouteTripState> {
  final ShoppingCartRepository shoppingCartRepository =
      new ShoppingCartRepository();
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Marker> routePoints;

  @override
  RouteTripState get initialState => InitialRouteTripState();

  @override
  Stream<RouteTripState> mapEventToState(
    RouteTripEvent event,
  ) async* {
    if (event is GetRouteTripPoints) {
      ShoppingCart shoppingCart = event.props[0];
      Position currentPosition = event.props[1];
      yield* _mapLoadShoppingPointsToState(shoppingCart, currentPosition);
    }
  }

  Stream<RouteTripState> _mapLoadShoppingPointsToState(
      ShoppingCart shoppingCart, Position currentPosition) async* {
    yield RouteTripsLoading();
    try {
      List<Position> shoppingTripPoints =
          shoppingCartRepository.getRouteTripPoints();
      print(routePoints);
      yield RouteTripsLoaded(routePoints);
    } catch (error) {
      yield RouteTripsFailedLoading(error);
    }
  }
}

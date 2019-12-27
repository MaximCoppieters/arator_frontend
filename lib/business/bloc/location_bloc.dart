import 'dart:async';
import 'package:arator/business/gps_service.dart';
import 'package:arator/data/model/MapLocation.dart';
import 'package:arator/data/model/UserAddress.dart';
import 'package:arator/data/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import './bloc.dart';
import 'package:geocoder/geocoder.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GpsService _gpsService = GpsService();
  final UserRepository _userRepository = UserRepository();

  @override
  LocationState get initialState => InitialLocationState();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is GetMapLocation) {
      yield* _mapLoadMapPositionToLocation(event.mapPosition);
    } else if (event is GetUserLocation) {
      yield* _mapLoadUserPositionToLocation();
    } else if (event is SaveUserAddress) {
      yield* _mapSaveAddress(event.userAddress);
    }
  }

  Stream<LocationState> _mapLoadUserPositionToLocation() async* {
    yield LocationLoading();
    try {
      Position userPosition = await _gpsService.getUserPosition();
      Address userAddress = await _gpsService.getPositionAddress(userPosition);
      var mapLocation =
          MapLocation(position: userPosition, address: userAddress);
      yield LocationLoaded(mapLocation);
    } catch (error) {
      LocationFailedLoading(error);
    }
  }

  Stream<LocationState> _mapLoadMapPositionToLocation(
      Position mapPosition) async* {
    yield LocationLoading();
    try {
      Address positionAddress =
          await _gpsService.getPositionAddress(mapPosition);
      var mapLocation =
          MapLocation(position: mapPosition, address: positionAddress);
      yield LocationLoaded(mapLocation);
    } catch (error) {
      LocationFailedLoading(error);
    }
  }

  Stream<LocationState> _mapSaveAddress(UserAddress userAddress) async* {
    yield AddressSaving();
    try {
      await _userRepository.saveUserAddress(userAddress);
      yield AddressSaved();
    } catch (error) {
      yield AddressSaveFailed(error);
    }
  }
}

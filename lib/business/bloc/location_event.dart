import 'package:arator/data/model/UserAddress.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class GetUserLocation extends LocationEvent {
  @override
  List<Object> get props => [];
}

class GetMapLocation extends LocationEvent {
  final Position mapPosition;
  GetMapLocation(this.mapPosition);
  @override
  List<Object> get props => [mapPosition];
}

class SaveUserAddress extends LocationEvent {
  final UserAddress userAddress;
  SaveUserAddress(this.userAddress);
  @override
  List<Object> get props => [userAddress];
}

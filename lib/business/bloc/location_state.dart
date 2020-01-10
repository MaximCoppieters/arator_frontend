import 'package:arator/data/model/MapLocation.dart';
import 'package:arator/utils/exceptions/gps_exception.dart';
import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class InitialLocationState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {
  @override
  List<Object> get props => null;
}

class LocationLoaded extends LocationState {
  final MapLocation location;
  LocationLoaded(this.location);
  @override
  List<Object> get props => [location];
}

class AddressSaving extends LocationState {
  @override
  List<Object> get props => null;
}

class AddressSaved extends LocationState {
  @override
  List<Object> get props => null;
}

class AddressSaveFailed extends LocationFailedLoading {
  AddressSaveFailed(GpsException error) : super(error);
}

class LocationFailedLoading extends LocationState {
  final GpsException error;
  LocationFailedLoading(this.error);
  @override
  List<Object> get props => [error];
}

import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';

class GpsService {
  final geolocator = Geolocator()..forceAndroidLocationManager;
  final geocoder = Geocoder.local;

  Future<Position> getUserPosition() {
    return geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Address> getPositionAddress(Position position) async {
    List<Address> addresses =
        await geocoder.findAddressesFromCoordinates(_toCoordinates(position));
    return addresses.first;
  }

  Coordinates _toCoordinates(Position position) {
    return Coordinates(position.latitude, position.longitude);
  }
}

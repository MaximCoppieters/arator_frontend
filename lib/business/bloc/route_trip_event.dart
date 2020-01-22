import 'package:arator/data/model/ShoppingCart.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class RouteTripEvent extends Equatable {
  const RouteTripEvent();
}

class GetRouteTripPoints extends RouteTripEvent {
  final ShoppingCart _shoppingCart;
  final Position _userPosition;
  GetRouteTripPoints(this._shoppingCart, this._userPosition);

  @override
  List<Object> get props => [_shoppingCart, _userPosition];
}

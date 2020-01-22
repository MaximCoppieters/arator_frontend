import 'dart:convert';

import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class ShoppingCartRepository extends Repository {
  static final shoppingCartEndpoint = "/user/shoppingcart";
  static final shoppingTripEndingPoint = "/user/shoppingcart/trip";
  final AppHttpClient _httpClient = AppHttpClient();

  Future<ShoppingCart> getShoppingCart() async {
    BaseResponse res =
        await _httpClient.getJsonStreamed(endpoint: shoppingCartEndpoint);

    dynamic shoppingCartJson =
        json.decode(await (res as StreamedResponse).stream.bytesToString());

    return ShoppingCart.fromJson(shoppingCartJson);
  }

  Future<void> updateShoppingCart(ShoppingCart shoppingCart) async {
    Response res = await _httpClient.postJson(
        endpoint: shoppingCartEndpoint, body: shoppingCart);

    if (res.statusCode != 201) {
      print(res.body);
      throw new FormException(message: "Unable to access server");
    }
  }

  List<Position> getRouteTripPoints() {
    return [
      Position(latitude: 48.3704074, longitude: 14.5125757),
      Position(latitude: 48.3662442, longitude: 14.5169093)
    ];
  }
}

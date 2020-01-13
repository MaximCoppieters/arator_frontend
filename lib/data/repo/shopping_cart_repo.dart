import 'dart:convert';

import 'package:arator/data/model/ShoppingCart.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:http/http.dart';

class ShoppingCartRepository extends Repository {
  static final shoppingCartEndpoint = "";
  final AppHttpClient _httpClient = AppHttpClient();

  Future<ShoppingCart> getShoppingCart() async {
    BaseResponse res =
        await _httpClient.getJson(endpoint: shoppingCartEndpoint);

    dynamic shoppingCartJson =
        json.decode(await (res as StreamedResponse).stream.bytesToString());

    return ShoppingCart.fromJson(shoppingCartJson);
  }

  Future<void> updateShoppingCart(ShoppingCart shoppingCart) async {
    BaseResponse res = await _httpClient.putJson(
        endpoint: shoppingCartEndpoint, body: shoppingCart);

    Map<String, dynamic> responseBody =
        jsonDecode(await (res as StreamedResponse).stream.bytesToString());

    if (res.statusCode != 201) {
      parseAndThrowException(responseBody);
    }
  }
}

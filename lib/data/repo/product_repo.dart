import 'dart:convert';

import 'package:arator/data/model/MapLocation.dart';
import 'package:arator/data/model/Model.dart';
import 'package:arator/data/model/Product.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:http/http.dart';

class ProductRepository extends Repository {
  static final productsEndpoint = "/product";
  static final userProductsEndpoint = "/product/personal";
  final AppHttpClient _httpClient = AppHttpClient();

  Future<List<Product>> getProducts() async {
    return _getProductsAtEndpoint(productsEndpoint);
  }

  Future<List<Product>> getProductsFromLocation(MapLocation location) async {
    return _getProductsAtEndpoint(productsEndpoint, body: location);
  }

  Future<List<Product>> _getProductsAtEndpoint(String endpoint,
      {Model body}) async {
    BaseResponse res =
        await _httpClient.getJson(endpoint: endpoint, body: body);

    if (res.statusCode != 200) {
      throw new FormException(message: "Unable to access server");
    }

    List<dynamic> productsJson =
        json.decode(await (res as StreamedResponse).stream.bytesToString());
    print(productsJson);

    if (productsJson.isEmpty) {
      throw new FormException(message: "No products were found");
    }

    List<Product> products = [];
    try {
      for (dynamic productJson in productsJson) {
        Product product = Product.fromJson(productJson);
        products.add(product);
      }
    } catch (err) {
      print(err);
    }
    return products;
  }

  Future<List<Product>> getPersonalProducts() async {
    return _getProductsAtEndpoint(userProductsEndpoint);
  }

  Future<void> addProduct(Product product) async {
    BaseResponse res = await _httpClient.postProduct(
        endpoint: productsEndpoint, body: product);

    if (res.statusCode != 201) {
      var error =
          jsonDecode(await (res as StreamedResponse).stream.bytesToString());
      parseAndThrowException(error);
    }
  }
}

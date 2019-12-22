import 'dart:convert';

import 'package:arator/data/model/Product.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/enums/input_name.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:http/http.dart';

class ProductRepository extends Repository {
  static final productsEndpoint = "/product";
  static final userProductsEndpoint = "/product/personal";
  final AppHttpClient _httpClient = AppHttpClient();

  Future<List<Product>> getProducts() async {
    return _getProductsAtEndpoint(productsEndpoint);
  }

  Future<List<Product>> _getProductsAtEndpoint(String endpoint) async {
    Response res = await _httpClient.getJson(endpoint: endpoint);

    if (res.statusCode != 200) {
      throw new FormException(message: "Unable to access server");
    }

    List<dynamic> productsJson = json.decode(res.body);

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
    StreamedResponse res = await _httpClient.postProduct(
        endpoint: productsEndpoint, body: product);

    if (res.statusCode != 201) {
      var error = jsonDecode(await res.stream.bytesToString());
      parseAndThrowException(error);
    }
  }
}

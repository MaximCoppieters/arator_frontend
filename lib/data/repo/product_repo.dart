import 'dart:convert';

import 'package:arator/data/model/Product.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:arator/utils/app_http_client.dart';
import 'package:arator/utils/enums/input_name.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:http/http.dart';

class ProductRepository extends Repository {
  static final productEndpoint = "/product";
  final AppHttpClient _httpClient = AppHttpClient();

  Future<List<Product>> getProducts() async {
    Response res = await _httpClient.getJson(endpoint: productEndpoint);

    if (res.statusCode != 200) {
      throw new FormException(message: "Unable to access server");
    }

    List<dynamic> productsJson = json.decode(res.body);

    if (productsJson.isEmpty) {
      throw new FormException(message: "No products were found");
    }

    List<Product> products = productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    products.forEach((product) => {print(jsonEncode(product.seller))});
    return products;
  }

  Future<void> addProduct(Product product) async {
    Response res =
        await _httpClient.postJson(endpoint: productEndpoint, body: product);

    if (res.statusCode != 201) {
      print(res.body);
      throw new FormException(field: InputName.priceInEuro, message: "wrong");
    }
  }
}

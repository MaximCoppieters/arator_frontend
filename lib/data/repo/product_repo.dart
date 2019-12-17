import 'dart:io';

import 'package:arator/data/model/Product.dart';
import 'package:arator/data/model/units/WeightUnit.dart';
import 'package:arator/data/repo/repo.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends Repository {
  static final productEndpoint = "/product";

  List<Product> _products = [
    Product(
        name: "Apples",
        imagePath: "assets/images/apples.jpg",
        type: "Jonagold",
        description: "Beautiful",
        priceInEuro: 20.0,
        weightUnit: WeightUnit.GRAM),
  ];

  Future<List<Product>> getProducts() async {
    var res = await http.post(baseUrl + productEndpoint,
        headers: {HttpHeaders.contentTypeHeader: Repository.appJson});
  }

  Future<bool> addProduct(Product product) async {
    return Future.delayed(Duration(seconds: 1), () {
      _products.add(product);
      return true;
    });
  }
}

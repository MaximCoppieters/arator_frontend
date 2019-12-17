import 'package:arator/data/model/Produce.dart';
import 'package:arator/data/model/units/WeightUnit.dart';

class ProductRepository {
  List<Produce> _products = [
    Produce(
        name: "Apples",
        imagePath: "assets/images/apples.jpg",
        type: "Jonagold",
        description: "Beautiful",
        priceInDollar: 20.0,
        weightUnit: WeightUnit.GRAM),
  ];

  Future<List<Produce>> getProducts() async {
    return Future.delayed(Duration(seconds: 1), () {
      return _products;
    });
  }

  Future<bool> addProduct(Produce product) async {
    return Future.delayed(Duration(seconds: 1), () {
      _products.add(product);
      return true;
    });
  }
}

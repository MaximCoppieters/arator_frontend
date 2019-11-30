import 'package:arator/data/Produce.dart';
import 'package:arator/data/units/WeightUnits.dart';

class ProductRepository {
  Future<List<Produce>> getProducts() async {
    List<Produce> products = [
      new Produce(
          name: "Apples",
          imagePath: "assets/images/apples.jpg",
          type: "Jonagold",
          description: "Beautiful",
          priceInDollar: 20.0,
          weightUnit: WeightUnits.GRAM),
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return products;
    });
  }
}

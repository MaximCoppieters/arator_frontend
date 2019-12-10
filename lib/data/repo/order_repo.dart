import 'package:arator/data/Order.dart';
import 'package:arator/data/units/WeightUnits.dart';

import '../Produce.dart';
import '../User.dart';

class OrderRepository {
  Future<List<Order>> getOrdersOfUser(User user) async {
    List<Order> products = [
      Order(products: [
        Produce(
            name: "Apples",
            imagePath: "assets/images/apples.jpg",
            type: "Jonagold",
            description: "Beautiful",
            priceInDollar: 20.0,
            weightUnit: WeightUnits.GRAM),
      ], buyer: user),
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return products;
    });
  }
}

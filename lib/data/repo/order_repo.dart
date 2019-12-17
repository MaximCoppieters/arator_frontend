import 'package:arator/data/model/Order.dart';
import 'package:arator/data/model/units/WeightUnit.dart';

import '../model/Produce.dart';
import '../model/User.dart';

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
            weightUnit: WeightUnit.GRAM),
      ], buyer: user),
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return products;
    });
  }
}

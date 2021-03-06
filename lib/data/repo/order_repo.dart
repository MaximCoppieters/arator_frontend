import 'package:arator/data/model/Order.dart';
import 'package:arator/data/model/units/WeightUnit.dart';

import '../model/Product.dart';
import '../model/User.dart';

class OrderRepository {
  Future<List<Order>> getOrdersOfUser(User user) async {
    List<Order> products = [
      Order(products: [
        Product(
            name: "Apples",
            imageUrl: "assets/images/apples.jpg",
            type: "Jonagold",
            description: "Beautiful",
            priceInEuro: 20.0,
            weightUnit: WeightUnit.Gram),
      ], buyer: user),
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return products;
    });
  }
}

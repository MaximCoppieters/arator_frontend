import 'Produce.dart';
import 'User.dart';

class Order {
  List<Produce> products;
  User buyer;

  Order({this.products, this.buyer});
}

import 'Produce.dart';
import 'User.dart';

class Order {
  List<Produce> products;
  User buyer;
  User seller;

  Order({this.products, this.buyer});
}

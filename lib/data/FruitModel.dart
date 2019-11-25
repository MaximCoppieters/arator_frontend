import 'package:scoped_model/scoped_model.dart';

import 'Produce.dart';

class FruitModel extends Model {
  List<Produce> fruits = new List<Produce>();

  add(Produce fruit) {
    fruits.add(fruit);
    notifyListeners();
  }

  remove(Produce fruit) {
    fruits.remove(fruit);
    notifyListeners();
  }
}

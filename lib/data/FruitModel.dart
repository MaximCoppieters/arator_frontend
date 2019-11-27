import 'package:scoped_model/scoped_model.dart';

import 'Produce.dart';
import 'User.dart';

class ProduceModel extends Model {
  List<Produce> userProduce = new List<Produce>();

  Produce selectedProduce;

  static User pedroFernandez = new User(
      email: "pedro.fernandez@gmail.com",
      userName: "Pedro Fernandez",
      profileImagePath: "assets/images/pedro.jpg");
  static User enrico = new User(
      email: "enrico.fernandez@gmail.com",
      userName: "Enrico Fèrera",
      profileImagePath: "assets/images/pedro.jpg");
  List<Produce> nearbyProduce = [
    new Produce("Apple", "assets/images/apples.jpg", "kg", 2.0, "€", "2,5km",
        pedroFernandez),
    new Produce("Cauliflower", "assets/images/cauliflower.jpg", "dollar", 6.0,
        "€", "3,5km", enrico),
    new Produce("Lettuce", "assets/images/lettuce.jpg", "euro", 3.0, "€",
        "2,5km", pedroFernandez),
    new Produce("Pears", "assets/images/pears.jpg", "euro", 2.0, "€", "2,5km",
        pedroFernandez),
    new Produce("Tomatoes", "assets/images/tomatoes.jpg", "euro", 2.0, "€",
        "2,5km", pedroFernandez),
    new Produce("Potatoes", "assets/images/russet_potato.jpg", "euro", 2.0, "€",
        "2,5km", pedroFernandez),
  ];

  add(Produce produce) {
    userProduce.add(produce);
    notifyListeners();
  }

  remove(Produce produce) {
    userProduce.remove(produce);
    notifyListeners();
  }

  selectProduce(Produce produce) {
    selectedProduce = produce;
    notifyListeners();
  }
}

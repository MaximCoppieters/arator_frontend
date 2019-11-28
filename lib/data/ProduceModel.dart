import 'package:arator/data/Address.dart';
import 'package:arator/data/ShippingUnitChoice.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Produce.dart';
import 'Review.dart';
import 'ShippingUnitChoice.dart';
import 'User.dart';

class ProduceModel extends Model {
  List<Produce> userProduce = new List<Produce>();
  Produce selectedProduce;
  User selectedUser;

  static User enrico = new User(
      email: "enrico.fernandez@gmail.com",
      userName: "Enrico Fèrera",
      address: Address(
          street: "Daalhofstraat",
          number: "5c",
          postalCode: "3840",
          country: "Belgium"),
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      profileImagePath: "assets/images/pedro.jpg");
  static User pedroFernandez = new User(
      email: "pedro.fernandez@gmail.com",
      userName: "Pedro Fernandez",
      address: Address(
          street: "Daalhofstraat",
          number: "5c",
          postalCode: "3840",
          country: "Belgium"),
      profileImagePath: "assets/images/pedro.jpg",
      reviews: [new Review(4, "Will buy from again, thanks!", enrico)],
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");

  static List<ShippingUnitChoice> shippingUnitChoices = [
    new ShippingUnitChoice("ada", 1000, "Emmer", "gram"),
    new ShippingUnitChoice("azdazda", 2, "Doos", "kilogram"),
    new ShippingUnitChoice("azdazda", 500, "Plastic Zakje", "gram"),
  ];
  List<Produce> nearbyProduce = [
    new Produce("Apple", "assets/images/apples.jpg", "kilogram",
        shippingUnitChoices, 2.0, "€", "2,5km", pedroFernandez),
    new Produce("Cauliflower", "assets/images/cauliflower.jpg", "kilogram",
        shippingUnitChoices, 6.0, "€", "3,5km", enrico),
    new Produce("Lettuce", "assets/images/lettuce.jpg", "kilogram",
        shippingUnitChoices, 3.0, "€", "2,5km", pedroFernandez),
    new Produce("Pears", "assets/images/pears.jpg", "kilogram",
        shippingUnitChoices, 2.0, "€", "2,5km", pedroFernandez),
    new Produce("Tomatoes", "assets/images/tomatoes.jpg", "kilogram",
        shippingUnitChoices, 2.0, "€", "2,5km", pedroFernandez),
    new Produce("Potatoes", "assets/images/russet_potato.jpg", "kilogram",
        shippingUnitChoices, 2.0, "€", "2,5km", pedroFernandez),
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

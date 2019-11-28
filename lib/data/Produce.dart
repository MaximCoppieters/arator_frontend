import 'package:arator/data/ShippingUnitChoice.dart';

import 'User.dart';

class Produce {
  final String species;
  final String imagePath;
  String family;
  String subspecies;
  num amount;
  String description;
  num price;
  String priceUnit;
  User seller;
  List<ShippingUnitChoice> shippingUnitChoices;
  String amountUnit;
  String distance;

  Produce(
      this.species,
      this.imagePath,
      this.amountUnit,
      this.shippingUnitChoices,
      this.price,
      this.priceUnit,
      this.distance,
      this.seller);

  @override
  String toString() {
    return family.replaceAll("_", " ") + "->" + species.replaceAll("_", " ");
  }

  String getPricePerUnit() {
    return "$priceUnit$price/$amountUnit";
  }
}

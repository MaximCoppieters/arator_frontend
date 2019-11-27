import 'User.dart';

class Produce {
  final String species;
  final String imagePath;
  String family;
  String subspecies;
  num amount;
  String amountUnit;
  String description;
  num price;
  String priceUnit;
  User seller;
  String distance;

  Produce(this.species, this.imagePath, this.amountUnit, this.price,
      this.priceUnit, this.distance, this.seller);

  @override
  String toString() {
    return family.replaceAll("_", " ") + "->" + species.replaceAll("_", " ");
  }
}

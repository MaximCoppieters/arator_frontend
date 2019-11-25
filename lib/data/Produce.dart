class Produce {
  final String species;
  final String imagePath;
  String family;
  String subspecies;
  num amount;
  String description;
  String unit;

  Produce(this.species, this.imagePath);

  @override
  String toString() {
    return family.replaceAll("_", " ") + "->" + species.replaceAll("_", " ");
  }
}

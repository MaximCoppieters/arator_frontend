enum WeightUnit { Kilogram, Gram, Lbs }

abstract class WeightUnits {
  static Map<WeightUnit, String> shorthands = {
    WeightUnit.Kilogram: "kg",
    WeightUnit.Gram: "g",
    WeightUnit.Lbs: "lbs"
  };

  static String shorthand(WeightUnit weightUnit) {
    return shorthands[weightUnit];
  }
}

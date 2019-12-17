import 'package:arator/data/model/units/WeightUnit.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class Produce {
  final String name;
  final String imagePath;
  final String type;
  final String description;
  final num priceInDollar;
  final WeightUnit weightUnit;
  num amount = 1;
  User seller;

  Produce(
      {@required this.name,
      this.imagePath,
      this.type,
      this.description,
      this.priceInDollar,
      this.weightUnit});
}

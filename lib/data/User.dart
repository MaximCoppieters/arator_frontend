import 'package:arator/data/Address.dart';

import 'Produce.dart';
import 'Review.dart';

class User {
  String email;
  String userName;
  String profileImagePath;
  String description;
  Address address;
  String about;

  List<Produce> products;
  List<Review> reviews;

  User(
      {this.email,
      this.userName,
      this.profileImagePath,
      this.reviews,
      this.address,
      this.about});
}

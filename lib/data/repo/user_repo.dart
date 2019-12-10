import '../Address.dart';
import '../Review.dart';
import '../User.dart';

class UserRepository {
  Future<User> getUserWithEmail(String email) async {
    return Future.delayed(Duration(seconds: 1), () {
      return new User(
        email: email,
        userName: "Pedro Fernandez",
        profileImagePath: "assets/images/pedro.png",
        about: "Lorem ipsum dolor amani heala azpkada dspqdqs",
        reviews: [
          new Review(
              4,
              "Great products, thanks",
              User(
                  userName: "Enrico",
                  profileImagePath: "assets/images/pedro.png")),
        ],
        address: Address(
            street: "Daalhofstraat",
            number: "5c",
            postalCode: "3840",
            country: "Belgium"),
      );
    });
  }
}

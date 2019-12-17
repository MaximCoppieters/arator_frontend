class UserCredentials {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const UserCredentials(
      {this.email, this.password, this.confirmPassword, this.name});

  Map<String, dynamic> toJson() {
    var map = {
      "email": email,
      "password": password,
    };
    if (confirmPassword != null) {
      map["confirmPassword"] = confirmPassword;
    }
    if (name != null) {
      map["name"] = name;
    }
    return map;
  }
}

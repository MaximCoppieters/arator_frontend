class UserCredentials {
  final String email;
  final String password;
  final String confirmPassword;

  const UserCredentials({this.email, this.password, this.confirmPassword});

  Map<String, dynamic> toJson() {
    var map = {
      "email": email,
      "password": password,
    };
    if (confirmPassword != null) {
      map["confirmPassword"] = confirmPassword;
    }
    return map;
  }
}

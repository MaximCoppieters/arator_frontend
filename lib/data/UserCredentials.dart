class UserCredentials {
  final String email;
  final String password;
  final String confirmPassword;

  const UserCredentials({this.email, this.password, this.confirmPassword});

  Map<String, dynamic> toJson() =>
      {email: email, password: password, confirmPassword: confirmPassword};
}

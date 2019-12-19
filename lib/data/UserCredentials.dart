class UserCredentials {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const UserCredentials(
      {this.email, this.password, this.confirmPassword, this.name});
}

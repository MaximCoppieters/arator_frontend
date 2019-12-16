import 'package:arator/utils/enums/login_field.dart';
import 'package:enum_to_string/enum_to_string.dart';

class AuthenticationException implements Exception {
  LoginField field;
  String message;
  AuthenticationException(this.field, this.message);

  AuthenticationException.fromResponseBody(
      Map<String, dynamic> errorResponseBody) {
    if (errorResponseBody["details"] == null) {
      this.field = LoginField.email;
      this.message = errorResponseBody["message"];
    } else {
      var errorDetails = errorResponseBody["details"][0];
      this.message = getErrorMessage(errorDetails);
      this.field = getErrorField(errorDetails);
    }
  }

  String getErrorMessage(Map<String, dynamic> errorDetails) {
    return errorDetails["message"];
  }

  LoginField getErrorField(Map<String, dynamic> errorDetails) {
    var errorFieldString = errorDetails["context"]["label"];
    return EnumToString.fromString(LoginField.values, errorFieldString);
  }
}

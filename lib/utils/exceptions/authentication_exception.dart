import 'package:arator/utils/enums/login_field.dart';
import 'package:enum_to_string/enum_to_string.dart';

class AuthenticationException implements Exception {
  LoginField field;
  String message;
  AuthenticationException(this.message);

  AuthenticationException.fromResponseBody(
      Map<String, dynamic> errorResponseBody) {
    if (errorResponseBody["error"] != null) {
      errorResponseBody = errorResponseBody["error"];
    }

    if (errorResponseBody["details"] == null) {
      this.field = LoginField.email;
      this.message = errorResponseBody["message"];
    } else {
      var errorDetails = errorResponseBody["details"][0];
      this.message = getErrorMessage(errorDetails);
      this.field = getErrorField(errorDetails);

      reformulateErrorMessage();
    }
    this.message = this.message.replaceAll('"', '');
  }

  String reformulateErrorMessage() {
    if (this.field == LoginField.confirmPassword) {
      this.message = "Passwords don't match";
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

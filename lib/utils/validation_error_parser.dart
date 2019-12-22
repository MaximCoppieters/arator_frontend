import 'package:arator/utils/enums/input_name.dart';
import 'package:enum_to_string/enum_to_string.dart';

class ValidationErrorParser {
  InputName _errorFormField;
  Map<String, dynamic> _errorBody;
  InputName field;
  String errorMessage;

  ValidationErrorParser(this._errorBody) {
    _removeErrorNestingIfPresent(_errorBody);
    field = _parseErrorField(_errorBody["details"][0]);
    errorMessage = _parseErrorMessage(_errorBody);
  }

  bool _inputWasWrong() {
    return _errorBody["details"] == null;
  }

  InputName _parseErrorField(Map<String, dynamic> errorDetails) {
    if (_inputWasWrong()) {
      return null;
    } else {
      var errorFieldString = errorDetails["context"]["label"];
      return EnumToString.fromString(InputName.values, errorFieldString);
    }
  }

  String _parseErrorMessage(Map<String, dynamic> errorBody) {
    if (this._errorFormField == InputName.confirmPassword) {
      return "Passwords don't match";
    }

    if (_inputWasWrong()) {
      return errorBody["message"];
    } else {
      var errorMessage = errorBody["details"][0]["message"];
      return _cleanUpErrorMessage(errorMessage);
    }
  }

  String _cleanUpErrorMessage(errorMessage) {
    return errorMessage.replaceAll('"', '');
  }

  void _removeErrorNestingIfPresent(Map<String, dynamic> errorBody) {
    if (errorBody["error"] != null) {
      errorBody = errorBody["error"];
    }
  }
}

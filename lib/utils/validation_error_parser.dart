import 'package:arator/utils/enums/input_name.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:enum_to_string/enum_to_string.dart';

class ValidationErrorParser {
  InputName _errorFormField;
  Map<String, dynamic> _errorBody;
  InputName field;
  String errorMessage;

  ValidationErrorParser(this._errorBody) {
    _removeErrorNestingIfPresent();
    try {
      field = _parseErrorField();
      errorMessage = _parseErrorMessage();
    } catch (error) {
      throw new FormException(message: error.message);
    }
  }

  bool _inputWasWrong() {
    return _errorBody["details"] == null;
  }

  InputName _parseErrorField() {
    var errorDetails = this._errorBody["details"][0];
    if (_inputWasWrong()) {
      return null;
    } else {
      var errorFieldString = errorDetails["context"]["label"];
      return EnumToString.fromString(InputName.values, errorFieldString);
    }
  }

  String _parseErrorMessage() {
    if (this._errorFormField == InputName.confirmPassword) {
      return "Passwords don't match";
    }

    if (_inputWasWrong()) {
      return this._errorBody["message"];
    } else {
      var errorMessage = this._errorBody["details"][0]["message"];
      return _cleanUpErrorMessage(errorMessage);
    }
  }

  String _cleanUpErrorMessage(errorMessage) {
    return errorMessage.replaceAll('"', '');
  }

  void _removeErrorNestingIfPresent() {
    if (this._errorBody["error"] != null) {
      this._errorBody = this._errorBody["error"];
    }
  }
}

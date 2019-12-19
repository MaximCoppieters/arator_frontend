import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:arator/utils/validation_error_parser.dart';

abstract class Repository {
  parseAndThrowException(Map<String, dynamic> errorBody) {
    var errorParser = ValidationErrorParser(errorBody);
    throw new FormException(
        field: errorParser.field, message: errorParser.errorMessage);
  }
}

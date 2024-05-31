import 'package:injectable/injectable.dart';

import 'package:olearis_test/logic/api/custom_trace/custom_trace.dart';
import 'package:olearis_test/logic/api/roots/roots.dart';
import 'package:olearis_test/logic/models/models.dart';

@LazySingleton()
class Api {
  final AuthClient _auth;

  Api(
    this._auth,
  );

  AuthClient get auth => _auth;

  static AppError createParsingError(dynamic e, StackTrace stackTrace) {
    var error = '';
    try {
      final functionName = CustomTrace(stackTrace).functionName;
      error = '🛑🛑🛑PARSING_ERROR $functionName: $e🛑🛑🛑';

      return AppError.parsingModel(error);
    } catch (_) {
      error = '🛑🛑🛑PARSING_ERROR $e🛑🛑🛑';

      return AppError.parsingModel(error);
    }
  }
}

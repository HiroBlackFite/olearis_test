import 'package:dartz/dartz.dart';

import 'package:olearis_test/logic/models/models.dart';

abstract class AuthClient {
  Future<Either<AppError, String>> signIn({
    required String login,
    required String password,
  });
}

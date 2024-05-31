import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:olearis_test/logic/api/client/api_client.dart';
import 'package:olearis_test/logic/api/roots/auth/auth_client.dart';
import 'package:olearis_test/logic/models/models.dart';

@LazySingleton(as: AuthClient)
class APIAuthClient implements AuthClient {
  final ApiClient _api;

  APIAuthClient(this._api);

  @override
  Future<Either<AppError, String>> signIn({
    required String login,
    required String password,
  }) async {
    String? response;
    await Future.delayed(const Duration(milliseconds: 1000), () {
      response = '123456';
    });

    if (response == null) return const Left(AppError.customError('ops'));

    return Right(response ?? '');
  }
}

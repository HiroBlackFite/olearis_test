part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial(AuthData data) = _Initial;
  const factory AuthState.loading(AuthData data) = _Loading;
  const factory AuthState.error(AuthData data) = _Error;

  const factory AuthState.signInSuccess(AuthData data) = _SignInSuccess;
}

@freezed
class AuthData with _$AuthData {
  const factory AuthData({
    String? userId,
    AppError? error,
    @Default(false) bool isLoading,
  }) = _AuthData;
}

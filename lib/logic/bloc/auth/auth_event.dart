part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _Init;

  const factory AuthEvent.signIn({
    required String login,
    required String password,
  }) = _SignIn;
}

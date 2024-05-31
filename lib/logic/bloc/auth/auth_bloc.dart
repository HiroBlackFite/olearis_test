import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:olearis_test/logic/api/api.dart';
import 'package:olearis_test/logic/models/models.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Api _api;
  late Emitter<AuthState> _emit;

  AuthBloc(this._api) : super(const AuthState.initial(AuthData())) {
    on<AuthEvent>(
      (event, emit) async {
        _emit = emit;
        await event.when(
          init: _init,
          signIn: _signIn,
        );
      },
    );
  }

  Future<void> _init() async {
    _emit(const AuthState.initial(AuthData()));
  }

  Future<void> _signIn(
    String login,
    String password,
  ) async {
    _emit(AuthState.loading(state.data.copyWith(isLoading: true)));

    final response = await _api.auth.signIn(
      login: login,
      password: password,
    );

    response.fold(
      _handleError,
      (data) {
        _emit(
          AuthState.signInSuccess(
            state.data.copyWith(
              isLoading: false,
              error: null,
              userId: data,
            ),
          ),
        );
      },
    );
  }

  void _handleError(AppError error) => _emit(
        AuthState.error(state.data.copyWith(
          error: error,
          isLoading: false,
        )),
      );
}

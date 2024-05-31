import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:olearis_test/config/config.dart';
import 'package:olearis_test/localization/locale_keys.g.dart';
import 'package:olearis_test/logic/bloc/auth/auth_bloc.dart';
import 'package:olearis_test/logic/bloc/bloc.dart';
import 'package:olearis_test/logic/services/services.dart';
import 'package:olearis_test/ui/screens/screens.dart';
import 'package:olearis_test/ui/widgets/widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const name = 'sign_in';
  static const route = '/$name';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthBloc get _authBloc => context.read<AuthBloc>();
  bool get _isActiveSubmit =>
      _loginController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _authBlocListener,
      builder: (context, state) {
        return Scaffold(
          appBar: const AppHeader(
            title: LocaleKeys.signIn_appBar,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: constraints.copyWith(
                      minHeight: constraints.maxHeight,
                      maxHeight: double.infinity,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppSVGImage.assets(
                          context: context,
                          assetName: AppImages.logo,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              AppTextField.login(controller: _loginController),
                              AppTextField.password(controller: _passwordController),
                            ],
                          ),
                        ),
                        AppButtons.primary(
                          isLoading: state.data.isLoading,
                          isActive: _isActiveSubmit,
                          title: LocaleKeys.signIn_submitButton,
                          onPressed: _onSubmit,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    log('${state.data.isLoading}');
    state.whenOrNull(
      error: (data) {
        errorHandler(context, error: data.error);
      },
      signInSuccess: (data) => context.push(HomeScreen.route),
    );
  }

  void _onSubmit() {
    final valid = _formKey.currentState?.validate() ?? false;

    if (valid) {
      _authBloc.add(AuthEvent.signIn(
        login: _loginController.text,
        password: _passwordController.text,
      ));
    }
  }
}

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:olearis_test/localization/locale_keys.g.dart';
import 'package:olearis_test/logic/extensions/extensions.dart';
import 'package:olearis_test/logic/services/services.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validate;

  const AppTextField._({
    required this.controller,
    this.hintText,
    this.validate,
  });

  factory AppTextField.login({
    required TextEditingController controller,
  }) =>
      AppTextField._(
        controller: controller,
        hintText: LocaleKeys.signIn_login.tr(),
        validate: AppValidations.login,
      );

  factory AppTextField.password({
    required TextEditingController controller,
  }) =>
      AppTextField._(
        controller: controller,
        hintText: LocaleKeys.signIn_password.tr(),
        validate: AppValidations.password,
      );

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final _focusNode = FocusNode();
  final _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: Builder(
        builder: (context) {
          return TextFormField(
            key: _formFieldKey,
            controller: widget.controller,
            cursorColor: context.colorScheme.onPrimary,
            validator: widget.validate,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          );
        },
      ),
    );
  }
}

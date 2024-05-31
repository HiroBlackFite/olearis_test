import 'package:easy_localization/easy_localization.dart';

import 'package:olearis_test/localization/locale_keys.g.dart';

class AppValidations {
  AppValidations._();

  static String? login(String? value) {
    if (value == null) return value;
    if (value.isEmpty) return LocaleKeys.signIn_loginIsRequired.tr();

    return null;
  }

  static String? password(String? value) {
    if (value == null) return value;
    if (value.isEmpty) return LocaleKeys.signIn_passwordIsRequired.tr();

    return null;
  }
}

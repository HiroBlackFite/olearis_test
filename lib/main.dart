import 'package:flutter/material.dart';

import 'package:olearis_test/app.dart';
import 'package:olearis_test/config/config.dart';
import 'package:olearis_test/logic/injection/injection.dart';

void main() async {
  await configureDependencies(env: Env.dev);

  runApp(const App());
}

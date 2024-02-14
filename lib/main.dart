import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nubank_home_reproduction/src/app.dart';
import 'package:nubank_home_reproduction/src/setup/setup.dart';

void main() async {
  await registerDependencies();
  runApp(const App());
  if (kIsWeb) {
    SemanticsBinding.instance.ensureSemantics();
  }
}

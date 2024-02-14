import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/src/generated/app_localizations.dart';

extension Localization on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);

  String get locale => Localizations.localeOf(this).languageCode;
}

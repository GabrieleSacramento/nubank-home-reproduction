import 'package:flutter/material.dart';
import '../generated/app_localizations.dart';

extension Localization on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);

  String get locale => Localizations.localeOf(this).languageCode;
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_dark_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_light_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_theme.dart';

enum NuThemes {
  defaultDeviceConfig,
  light,
  dark;

  NubankTheme get getRelatedNubankBackgroundColor {
    switch (this) {
      case NuThemes.light:
        return NubankLightTheme();
      case NuThemes.dark:
        return NubankDarkTheme();
      case NuThemes.defaultDeviceConfig:
        return _getDefaultDeviceConfigurationIsDarkMode
            ? NubankDarkTheme()
            : NubankLightTheme();
    }
  }

  static NuThemes get getDefaultTheme => NuThemes.defaultDeviceConfig;

  static NuThemes getByType({
    required String? value,
  }) {
    if (value == null) {
      return getDefaultTheme;
    }

    return NuThemes.values.firstWhere((status) => status.toString() == value);
  }

  bool get _getDefaultDeviceConfigurationIsDarkMode {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    return brightness == Brightness.dark;
  }
}

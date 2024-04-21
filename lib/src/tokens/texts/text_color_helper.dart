import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/src/tokens/colors/nubank_colors.dart';
import 'package:nubank_home_reproduction/src/tokens/colors/nubank_colors_enum.dart';

class TextColorHelper {
  static Color setColor(
    BuildContext context, {
    required NubankColorsEnum color,
  }) {
    return getColorByTheme(
      color: color,
      getColorByTheme: NubankColors(),
    );
  }

  static Color getColorByTheme({
    required NubankColorsEnum color,
    required NubankColors getColorByTheme,
  }) {
    switch (color) {
      case NubankColorsEnum.nuPurple:
        return NubankColors.nuPurple;
      case NubankColorsEnum.nuGrey:
        return NubankColors.nuGrey;
      case NubankColorsEnum.nuWhite:
        return NubankColors.nuWhite;
      case NubankColorsEnum.nuBlack:
        return NubankColors.nuBlack;
      case NubankColorsEnum.nuLightGrey:
        return NubankColors.nuLightGrey;
      case NubankColorsEnum.nuLightLight:
        return NubankColors.nuLightLight;
      case NubankColorsEnum.nuLightGrey2:
        return NubankColors.nuLightGrey2;
    }
  }
}

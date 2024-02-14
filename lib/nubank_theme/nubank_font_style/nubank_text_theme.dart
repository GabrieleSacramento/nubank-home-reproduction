import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_colors/nubank_colors.dart';

abstract class NubankTextTheme {
  Color get nuPurple;
  Color get nuGrey;
  Color get nuWhite;
  Color get nuBlack;
  Color get nuLightGrey;
  Color get nuLightLight;
}

class NubankTextLightColorsTheme extends NubankTextTheme {
  @override
  Color get nuPurple => NubankColors.nuPurple;

  @override
  Color get nuGrey => NubankColors.nuGrey;

  @override
  Color get nuWhite => NubankColors.nuWhite;

  @override
  Color get nuBlack => NubankColors.nuBlack;

  @override
  Color get nuLightGrey => NubankColors.nuLightGrey;

  @override
  Color get nuLightLight => NubankColors.nuLightLight;
}

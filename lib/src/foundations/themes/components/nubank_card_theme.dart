import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/src/tokens/colors/nubank_colors.dart';

abstract class NubankCardTheme {
  Color get nuWhite;
  Color get nuGrey;
  Color get nuBlack;
}

class NubankCardLightColorsTheme extends NubankCardTheme {
  @override
  Color get nuWhite => NubankColors.nuGrey;

  @override
  Color get nuBlack => NubankColors.nuBlack;

  @override
  Color get nuGrey => NubankColors.nuLightGrey2;
}

class NubankCardDarkColorsTheme extends NubankCardTheme {
  @override
  Color get nuWhite => NubankColors.nuLightGrey2;

  @override
  Color get nuBlack => NubankColors.nuWhite;

  @override
  Color get nuGrey => NubankColors.nuLightGrey2;
}

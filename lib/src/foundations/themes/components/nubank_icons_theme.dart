import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/src/tokens/colors/nubank_colors.dart';

abstract class NubankIconTheme {
  Color get nuWhite;
  Color get nuBlack;
}

class NubankIconLightColorsTheme extends NubankIconTheme {
  @override
  Color get nuWhite => NubankColors.nuWhite;

  @override
  Color get nuBlack => NubankColors.nuBlack;
}

class NubankIconDarkColorsTheme extends NubankIconTheme {
  @override
  Color get nuWhite => NubankColors.nuBlack;

  @override
  Color get nuBlack => NubankColors.nuWhite;
}

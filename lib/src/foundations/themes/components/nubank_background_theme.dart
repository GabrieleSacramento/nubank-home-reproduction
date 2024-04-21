import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/src/tokens/colors/nubank_colors.dart';

abstract class NuBackgroundTheme {
  Color get background;
}

class NuLightBackground implements NuBackgroundTheme {
  @override
  Color get background => NubankColors.nuWhite;
}

class NuDarkBackground implements NuBackgroundTheme {
  @override
  Color get background => NubankColors.nuBlack;
}

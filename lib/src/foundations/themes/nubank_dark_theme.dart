import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_background_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_card_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_text_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_icons_theme.dart';

class NubankDarkTheme extends NubankTheme {
  @override
  NubankTextTheme get textTheme => NubankTextDarkColorsTheme();

  @override
  NuBackgroundTheme get backgroundColor => NuDarkBackground();

  @override
  NubankCardTheme get cardTheme => NubankCardDarkColorsTheme();

  @override
  NubankIconTheme get iconTheme => NubankIconDarkColorsTheme();
}

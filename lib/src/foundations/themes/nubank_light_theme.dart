import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_background_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/nubank_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_card_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_text_theme.dart';
import 'package:nubank_home_reproduction/src/foundations/themes/components/nubank_icons_theme.dart';

class NubankLightTheme extends NubankTheme {
  @override
  NubankTextTheme get textTheme => NubankTextLightColorsTheme();

  @override
  NuBackgroundTheme get backgroundColor => NuLightBackground();

  @override
  NubankCardTheme get cardTheme => NubankCardLightColorsTheme();

  @override
  NubankIconTheme get iconTheme => NubankIconLightColorsTheme();
}

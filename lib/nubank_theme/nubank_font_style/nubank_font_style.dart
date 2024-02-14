import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_colors/nubank_colors_enum.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/nubank_fonts.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/text_color_helper.dart';

class NubankFontStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final NubankColorsEnum color;

  NubankFontStyle({
    required this.fontSize,
    required this.fontWeight,
    required this.fontFamily,
    required this.color,
  });

  const NubankFontStyle.bodyLargerStandard()
      : this.fontSize = 24,
        this.color = NubankColorsEnum.nuBlack,
        this.fontWeight = FontWeight.w700,
        this.fontFamily = NubankFonts.robotoMedium;

  const NubankFontStyle.bodyLargerShortLight()
      : this.fontSize = 18,
        this.color = NubankColorsEnum.nuWhite,
        this.fontWeight = FontWeight.w700,
        this.fontFamily = NubankFonts.robotoBold;

  const NubankFontStyle.bodyLargerShort()
      : this.fontSize = 18,
        this.fontWeight = FontWeight.w700,
        this.color = NubankColorsEnum.nuBlack,
        this.fontFamily = NubankFonts.robotoBold;
  const NubankFontStyle.bodyMediumStandardLight()
      : this.fontSize = 16,
        this.fontWeight = FontWeight.w700,
        this.color = NubankColorsEnum.nuWhite,
        this.fontFamily = NubankFonts.robotoBold;

  const NubankFontStyle.bodyMediumStandard()
      : this.fontSize = 16,
        this.fontWeight = FontWeight.w700,
        this.color = NubankColorsEnum.nuBlack,
        this.fontFamily = NubankFonts.robotoBold;

  const NubankFontStyle.bodyMediumShort()
      : this.fontSize = 14,
        this.fontWeight = FontWeight.w700,
        this.color = NubankColorsEnum.nuBlack,
        this.fontFamily = NubankFonts.robotoMedium;

  const NubankFontStyle.auxiliarMedium()
      : this.fontSize = 14,
        this.color = NubankColorsEnum.nuBlack,
        this.fontWeight = FontWeight.w700,
        this.fontFamily = NubankFonts.robotoRegular;

  const NubankFontStyle.auxiliarMediumNuPurple()
      : this.fontSize = 14,
        this.fontWeight = FontWeight.w700,
        this.color = NubankColorsEnum.nuPurple,
        this.fontFamily = NubankFonts.robotoRegular;

  const NubankFontStyle.auxiliarMediumLight()
      : this.fontSize = 14,
        this.fontWeight = FontWeight.w700,
        this.color = NubankColorsEnum.nuLightGrey,
        this.fontFamily = NubankFonts.robotoRegular;

  TextStyle toTextStyle(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: TextColorHelper.setColor(context, color: color),
      );
}

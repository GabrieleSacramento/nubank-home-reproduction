import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/nubank_font_style.dart';

class NubankText extends StatelessWidget {
  final NubankFontStyle textStyle;
  final String text;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final bool hasHyphenation;
  final bool hasMarkdown;

  const NubankText(
    this.text, {
    required this.textStyle,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
    this.hasHyphenation = false,
    this.hasMarkdown = false,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final currentTextStyle = textStyle.toTextStyle(context);

    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: currentTextStyle,
    );
  }
}

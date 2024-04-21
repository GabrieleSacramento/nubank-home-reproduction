import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nubank_home_reproduction/src/tokens/colors/nubank_colors.dart';
import 'package:nubank_home_reproduction/src/tokens/texts/nubank_font_style.dart';
import 'package:nubank_home_reproduction/src/atoms/text/nubank_text_style.dart';
import 'package:nubank_home_reproduction/src/atoms/assets/nubank_icons.dart';
import 'package:nubank_home_reproduction/src/tokens/size/nubank_spacing.dart';
import '../../../../utils/localizations.dart';

class MyCardsWidget extends StatelessWidget {
  const MyCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: NubankSpacing.sp24,
            right: NubankSpacing.sp24,
            bottom: NubankSpacing.sp16,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: NubankText(
                  strings.myCards,
                  textStyle: NubankFontStyle.bodyLargerStandard(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: NubankSpacing.sp32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NubankText(
                    'Cartão físico',
                    textStyle: NubankFontStyle.auxiliarMedium(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: <Widget>[
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          NubankColors.nuBlack, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        NubankIcons.card,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            NubankText(
                              'GABRIELE S C JESUS',
                              textStyle: NubankFontStyle.auxiliarMedium(),
                            ),
                            NubankText(
                              '....8807',
                              textStyle: NubankFontStyle.auxiliarMedium(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: NubankSpacing.sp8),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: NubankColors.nuBlack,
                        size: NubankSpacing.sp24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: NubankSpacing.sp24,
            right: NubankSpacing.sp24,
            bottom: NubankSpacing.sp16,
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: NubankSpacing.sp32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NubankText(
                    'Cartões virtuais',
                    textStyle: NubankFontStyle.auxiliarMedium(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: <Widget>[
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          NubankColors.nuBlack, BlendMode.srcIn),
                      child: SvgPicture.asset(
                        NubankIcons.card,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            NubankText(
                              'GABRIELE S C JESUS',
                              textStyle: NubankFontStyle.auxiliarMedium(),
                            ),
                            NubankText(
                              '....4289',
                              textStyle: NubankFontStyle.auxiliarMedium(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: NubankSpacing.sp8),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: NubankColors.nuBlack,
                        size: NubankSpacing.sp24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(
            left: NubankSpacing.sp24,
            right: NubankSpacing.sp24,
            top: NubankSpacing.sp16,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: NubankColors.nuPurple,
                  size: NubankSpacing.sp24,
                ),
                Padding(
                  padding: EdgeInsets.only(left: NubankSpacing.sp8),
                  child: NubankText(
                    'Criar cartão virtual',
                    textStyle: NubankFontStyle.auxiliarMediumNuPurple(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

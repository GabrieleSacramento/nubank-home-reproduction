import 'package:flutter/material.dart';
import 'package:nubank_home_reproduction/src/utils/localizations.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_colors/nubank_colors.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/nubank_font_style.dart';
import 'package:nubank_home_reproduction/nubank_theme/nubank_font_style/nubank_text_style.dart';
import 'package:nubank_home_reproduction/nubank_theme/nunbank_spacing/nubank_spacing.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NubankHomePage extends StatelessWidget {
  const NubankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _NuAppBar(),
      body: Column(
        children: [
          _NuBalanceWidget(),
          _NuTransactionCarousel(),
        ],
      ),
    );
  }
}

class _NuTransactionCarousel extends StatelessWidget {
  const _NuTransactionCarousel();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Padding(
      padding: const EdgeInsets.only(
          top: NubankSpacing.sp24, left: NubankSpacing.sp16),
      child: CarouselSlider(
        items: [
          _NuTransactionOption(
            title: strings.pixArea,
            icon: Icons.pix_outlined,
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.pay,
            icon: Icons.qr_code_2_outlined,
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.transfer,
            icon: Icons.upload,
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.deposit,
            icon: Icons.download,
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.cellPhoneRecharge,
            icon: Icons.phone_android_outlined,
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.getALoan,
            icon: Icons.monetization_on,
            onTap: () {},
          ),
          _NuTransactionOption(
            title: strings.charge,
            icon: Icons.money,
            onTap: () {},
          ),
        ],
        options: CarouselOptions(
          scrollPhysics: BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          viewportFraction: 0.22,
          padEnds: false,
          aspectRatio: 40 / 40,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}

class _NuTransactionOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _NuTransactionOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: NubankColors.nuGrey,
              borderRadius: BorderRadius.circular(NubankSpacing.sp50),
            ),
            width: NubankSpacing.sp72,
            height: NubankSpacing.sp72,
            child: Icon(
              icon,
              color: NubankColors.nuBlack,
              size: NubankSpacing.sp24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: NubankSpacing.sp10),
            child: NubankText(
              title,
              textAlign: TextAlign.center,
              textStyle: NubankFontStyle.bodyMediumShort(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NuBalanceWidget extends StatelessWidget {
  const _NuBalanceWidget();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: NubankSpacing.sp24,
        top: NubankSpacing.sp16,
        right: NubankSpacing.sp24,
      ),
      title: NubankText(
        strings.account,
        textStyle: NubankFontStyle.bodyLargerShort(),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: NubankSpacing.sp8),
        child: NubankText(
          'R\$ 50,00',
          textStyle: NubankFontStyle.bodyLargerShort(),
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: NubankColors.nuLightGrey,
        size: NubankSpacing.sp24,
      ),
    );
  }
}

class _NuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _NuAppBar();

  Size get preferredSize => Size.fromHeight(_appBarHeight);
  static const double _appBarHeight = NubankSpacing.sp124;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: NubankColors.nuPurple,
          expandedHeight: _appBarHeight,
          title: Container(
            decoration: BoxDecoration(
              color: NubankColors.nuLightLight,
              borderRadius: BorderRadius.circular(NubankSpacing.sp24),
            ),
            width: NubankSpacing.sp46,
            height: NubankSpacing.sp46,
            child: Icon(
              Icons.person,
              color: NubankColors.nuWhite,
              size: NubankSpacing.sp24,
            ),
          ),
          titleSpacing: NubankSpacing.sp24,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.visibility_outlined,
                  color: NubankColors.nuWhite,
                  size: NubankSpacing.sp24,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: NubankSpacing.sp24, right: NubankSpacing.sp24),
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.person_outlined,
                        color: NubankColors.nuWhite,
                      ),
                      Positioned(
                        right: 0,
                        bottom: -3,
                        child: Icon(Icons.message,
                            size: NubankSpacing.sp10,
                            color: NubankColors.nuWhite),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: NubankSpacing.sp24),
                  child: Icon(
                    Icons.help_outline,
                    color: NubankColors.nuWhite,
                    size: NubankSpacing.sp24,
                  ),
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(NubankSpacing.sp14),
            child: Padding(
              padding: const EdgeInsets.only(
                left: NubankSpacing.sp24,
                bottom: NubankSpacing.sp24,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: NubankText('${strings.hello}, Gabriele Sacramento',
                    textStyle: NubankFontStyle.bodyLargerShortLight()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
